#!/bin/bash
set -e

# Database migrations
echo "Applying database migrations..."
python3 manage.py migrate

# Background services (customize as needed)
services=(
  "group_assignment_service"
  "process_communication"
  "token_validation_service"
  "user_details_service"
  "start_grpc_server"
)

for service in "${services[@]}"; do
  if ! pgrep -f "[s]$service" >/dev/null; then
    echo "Starting $service..."
    python3 manage.py $service >> ${service}.log 2>&1 &
  fi
done

# Superuser creation (production-ready)
echo "Checking superuser account..."
if ! python3 manage.py shell -c "from django.contrib.auth import get_user_model; User = get_user_model(); exit(0 if User.objects.filter(is_superuser=True).exists() else 1)"; then
  echo "Creating initial superuser..."
  python3 manage.py create_superadmin
fi

# Start Django server
echo "Starting application server..."
exec python3 manage.py runserver 0.0.0.0:8000