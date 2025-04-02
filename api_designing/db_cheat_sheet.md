## **📌 Database Best Practices Cheat Sheet for Scalable & Optimized Systems**

### **1️⃣ Database Design Principles**
✅ **Use Normalization (Up to 3NF or 4NF)** – Reduces redundancy but balance with performance needs.  
✅ **Denormalization for Performance** – In read-heavy systems, duplicate data for faster reads.  
✅ **Use Indexing Properly** – Index frequently queried columns but avoid over-indexing.  
✅ **Choose the Right Database Type**:  
   - **SQL (Relational)** – MySQL, PostgreSQL, Google Spanner, etc. (Strong ACID compliance).  
   - **NoSQL (Document, Key-Value, Graph)** – MongoDB, DynamoDB, Cassandra (Best for scale, flexibility).  
✅ **Partitioning & Sharding** – Distribute large datasets across multiple servers.  
✅ **Use UUIDs or Snowflake IDs** – Instead of auto-increment IDs for distributed databases.  

---

### **2️⃣ Indexing Best Practices**
✅ **Primary Key Index** – Always use a primary key.  
✅ **Composite Indexes** – Index multiple columns in WHERE or JOIN clauses.  
✅ **Covering Index** – Index includes all needed columns for a query.  
✅ **Partial Indexing** – Index only specific values (`WHERE is_active = TRUE`).  
✅ **Avoid Over-indexing** – Too many indexes slow down writes.  
✅ **Use Full-Text Search** – Instead of `LIKE '%value%'`, use Elasticsearch or PostgreSQL FTS.  

---

### **3️⃣ Query Optimization**
✅ **Avoid SELECT \*** – Fetch only required columns.  
✅ **Use Joins Efficiently** – Prefer INNER JOIN over OUTER JOIN when possible.  
✅ **Use WHERE instead of HAVING** – HAVING filters after aggregation, WHERE is faster.  
✅ **Optimize GROUP BY & ORDER BY** – Ensure indexes cover these operations.  
✅ **Use Caching** – Redis, Memcached for frequently accessed data.  
✅ **Limit Large Queries** – Paginate results (`LIMIT 50 OFFSET 0`).  
✅ **Batch Inserts & Updates** – Instead of inserting/updating row by row.  

---

### **4️⃣ Scalability Best Practices**
✅ **Vertical Scaling (Scale-Up)** – Increase CPU, RAM, or Disk (Only a temporary fix).  
✅ **Horizontal Scaling (Scale-Out)** – Use read replicas and database sharding.  
✅ **Use Read Replicas** – Reduce load on the primary database.  
✅ **Distributed Databases** – Google Spanner, CockroachDB, TiDB for global scale.  
✅ **Use Connection Pooling** – PgBouncer, HikariCP for handling many connections.  
✅ **Rate Limiting & Throttling** – Prevent API or DB abuse.  

---

### **5️⃣ Data Integrity & Security**
✅ **Use Transactions (ACID)** – Ensure atomicity in critical operations.  
✅ **Encrypt Sensitive Data** – Store passwords using `bcrypt` or `Argon2`.  
✅ **Use Role-Based Access Control (RBAC)** – Restrict database access per role.  
✅ **Audit Logs** – Track changes to critical tables.  
✅ **Backup Strategy** – Automated backups, replication, and disaster recovery plans.  

---

### **6️⃣ Performance Monitoring & Tools**
✅ **EXPLAIN ANALYZE Queries** – Analyze slow queries in PostgreSQL/MySQL.  
✅ **Slow Query Logs** – Identify queries taking longer than 1s.  
✅ **Database Metrics Monitoring** – Use Prometheus, Datadog, or Google Cloud SQL monitoring.  
✅ **Connection Pooling & Load Balancing** – PgBouncer, ProxySQL.  

---

# **🚀 Redis Cheat Sheet: Scalable & Optimized Usage**  
---

## **1️⃣ Redis Basics & Data Types**
✅ **Strings** – Simple key-value storage (`SET key value`, `GET key`).  
✅ **Lists** – Ordered collection (`LPUSH`, `RPUSH`, `LPOP`, `LRANGE`).  
✅ **Sets** – Unordered, unique values (`SADD`, `SREM`, `SMEMBERS`).  
✅ **Sorted Sets (Zsets)** – Like Sets but with scores (`ZADD`, `ZRANGE`).  
✅ **Hashes** – Key-value store inside a key (`HSET`, `HGETALL`).  
✅ **Bitmaps & HyperLogLogs** – For analytics, counting unique elements.  
✅ **Streams** – Append-only log data (for event processing).  

---

## **2️⃣ Performance Optimization**
✅ **Use Connection Pooling** – Avoid opening/closing connections repeatedly.  
✅ **Pipeline Commands** – Batch multiple commands to reduce latency.  
✅ **Use `EXPIRE` on Keys** – Set TTL to prevent unnecessary memory usage.  
✅ **Eviction Policies** – Use `maxmemory-policy` (e.g., `allkeys-lru`, `volatile-lru`).  
✅ **Avoid Large Keys** – Break large hashes/lists into smaller sets.  
✅ **Sharding & Clustering** – Distribute data across multiple Redis nodes.  
✅ **Use Lua Scripting (`EVAL`)** – Run complex logic inside Redis.  

---

## **3️⃣ Redis Caching Best Practices**
✅ **Cache Strategies**:  
   - **Write-Through** – Update cache & database simultaneously.  
   - **Write-Behind** – Update DB asynchronously for performance.  
   - **Cache-aside** – Fetch from cache first, then database if missing.  
   - **TTL-Based Expiry** – Auto-remove stale data.  
✅ **Use `GETSET` to Lock Updates** – Prevent race conditions.  
✅ **Use `SCAN` Instead of `KEYS`** – `KEYS` is expensive, use `SCAN` for large datasets.  
✅ **Use `LRU` (Least Recently Used)** – Remove old, unused cache data.  
✅ **Set Expiry (`EXPIRE`) on Cache Data** – Avoid stale data accumulation.  

---

## **4️⃣ Scaling Redis**
✅ **Use Redis Sentinel** – High availability with automatic failover.  
✅ **Redis Cluster** – Scale horizontally with sharded data.  
✅ **Partitioning** – Distribute keys across multiple instances.  
✅ **Use Read Replicas** – Scale reads by adding replicas.  
✅ **Enable Persistence (`RDB`, `AOF`)** – Prevent data loss.  
✅ **Monitor with `INFO` & `MONITOR`** – Track memory usage, slow queries.  

---

## **5️⃣ Security & Reliability**
✅ **Use AUTH (`requirepass`)** – Secure access.  
✅ **Limit Network Exposure** – Bind to `127.0.0.1` or use firewall rules.  
✅ **Use Redis ACLs** – Restrict users and commands.  
✅ **Enable Persistence (`save`, `appendonly`)** – Avoid data loss.  
✅ **Backup Strategy** – Automate backups for disaster recovery.  

---

## **6️⃣ Redis Commands Cheat Sheet**
### **🔹 Basic Operations**
```bash
SET key value       # Store a value
GET key            # Retrieve a value
DEL key           # Delete a key
EXPIRE key 3600   # Set expiration (1 hour)
TTL key           # Check remaining TTL
```

### **🔹 Hashes (Key-Value Store)**
```bash
HSET user:1 name "Alice"
HGET user:1 name
HGETALL user:1
```

### **🔹 Lists (Queues, Stacks)**
```bash
LPUSH tasks "task1" "task2"  # Push left
RPUSH tasks "task3"          # Push right
LPOP tasks                   # Pop left
RPOP tasks                   # Pop right
LRANGE tasks 0 -1            # Get all elements
```

### **🔹 Sets (Unique Items)**
```bash
SADD visitors "user1" "user2"
SREM visitors "user1"
SMEMBERS visitors
```

### **🔹 Sorted Sets (Ranking, Leaderboards)**
```bash
ZADD leaderboard 100 "user1"
ZADD leaderboard 150 "user2"
ZRANGE leaderboard 0 -1 WITHSCORES
```

### **🔹 Transactions (Atomic Operations)**
```bash
MULTI
SET key1 "value1"
SET key2 "value2"
EXEC  # Execute transaction
```

### **🔹 Pub/Sub (Message Queue)**
```bash
PUBLISH channel "message"
SUBSCRIBE channel
```

---

## **7️⃣ Monitoring & Debugging**
✅ **Use `INFO`** – Get server metrics.  
✅ **Use `MONITOR`** – See real-time commands.  
✅ **Check Slow Queries** – `SLOWLOG GET 10`.  
✅ **Track Memory Usage** – `MEMORY USAGE key`.  
✅ **Use `SCAN` Instead of `KEYS`** – `SCAN 0 MATCH prefix:* COUNT 1000`.  

---
# **🚀 Redis Cheat Sheet: Advanced Features (Search, Streams, and Use Cases)**  

Redis isn't just a key-value store—it supports **full-text search, streams, and advanced use cases** like **real-time analytics, event processing, and caching**.  

---

## **1️⃣ Redis Search (🔎 Full-Text Search & Filtering with RediSearch)**
Redis provides powerful search capabilities using **RediSearch**, which supports **full-text search, filtering, ranking, and aggregation**.

### **🔹 Installing RediSearch Module**
If using Docker:
```bash
docker run -d --name redis-search redis/redis-stack:latest
```

### **🔹 Creating a Search Index**
```bash
FT.CREATE hotels_idx ON HASH PREFIX 1 "hotel:" 
SCHEMA name TEXT WEIGHT 5.0 
location TEXT WEIGHT 2.0 
rating NUMERIC SORTABLE
```
- **TEXT** → Full-text search  
- **NUMERIC** → Range queries  
- **WEIGHT** → Boost important fields  

### **🔹 Adding Data for Search**
```bash
HSET hotel:1 name "Serena Hotel" location "Dar es Salaam" rating 5
HSET hotel:2 name "Hyatt Regency" location "Arusha" rating 4
```

### **🔹 Searching for Data**
```bash
FT.SEARCH hotels_idx "Serena"
```
🔹 **Filter by rating (numeric filter)**:
```bash
FT.SEARCH hotels_idx "@rating:[4 5]"
```

🔹 **Search with Sorting & Pagination**:
```bash
FT.SEARCH hotels_idx "Hyatt" SORTBY rating DESC LIMIT 0 10
```

🔹 **Fuzzy Search (Spelling mistakes allowed)**:
```bash
FT.SEARCH hotels_idx "%Sarena%"
```

🔹 **Geo Search (Find hotels near a location)**:
```bash
FT.CREATE places_idx ON HASH PREFIX 1 "place:"
SCHEMA name TEXT location GEO
```
```bash
FT.SEARCH places_idx "@location:[34.0522 -118.2437 10 km]"
```

✅ **Best Use Cases**:  
✔ **E-commerce** – Search products quickly  
✔ **Hotel Listings** – Filter by price, location, etc.  
✔ **Geo-location Search** – Find nearby places  

---

## **2️⃣ Redis Streams (📌 Real-time Data Processing & Event Sourcing)**
Redis **Streams** allow **real-time data streaming**, making it useful for event-driven architectures.

### **🔹 Creating a Stream**
```bash
XADD sensor_data * temperature 30 humidity 70
```
- `XADD` → Add event to the stream  
- `*` → Auto-generate ID  

### **🔹 Reading from a Stream**
```bash
XRANGE sensor_data - +
```
- `- +` → Read from start to end  

### **🔹 Reading New Entries (Like Kafka Consumer Group)**
```bash
XREAD BLOCK 5000 STREAMS sensor_data $
```
- `$` → Read only **new** entries  

### **🔹 Consumer Groups (Multiple Consumers for Scaling)**
```bash
XGROUP CREATE sensor_group sensor_data $
```
- `XGROUP CREATE` → Create consumer group  

🔹 **Consumers Read Messages**:
```bash
XREADGROUP GROUP sensor_group consumer1 COUNT 1 STREAMS sensor_data >
```

🔹 **Acknowledge Messages**:
```bash
XACK sensor_data sensor_group 1634229223-0
```

✅ **Best Use Cases**:  
✔ **Real-time Analytics** – Monitor website traffic  
✔ **Event Sourcing** – Track system changes  
✔ **IoT Data Streaming** – Process sensor data  

---

## **3️⃣ Redis Advanced Use Cases**
✅ **Rate Limiting (Throttle API Requests)**
```bash
INCR user:123:requests
EXPIRE user:123:requests 60  # Limit for 1 min
```
🚀 Prevent API abuse by limiting requests **per minute**.  

✅ **Distributed Locks (Prevent Race Conditions)**
```bash
SET my_lock "locked" EX 10 NX
```
- `NX` → Set only if not exists  
- `EX 10` → Auto-expire after 10s  

✅ **Session Storage (Fast User Authentication)**
```bash
SETEX session:user123 3600 "token123"
```
🚀 Store session **for 1 hour**.

✅ **Leaderboards (Gaming, Ranking)**
```bash
ZADD leaderboard 200 "player1"
ZADD leaderboard 150 "player2"
ZRANGE leaderboard 0 -1 WITHSCORES
```

✅ **Message Queues (Lightweight Kafka Alternative)**
```bash
RPUSH queue "task1"
LPOP queue
```

---
