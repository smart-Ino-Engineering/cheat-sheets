# API Design Copilot Guide

This document provides guidelines for Copilot to follow during API implementation, ensuring consistency with the API Design Cheat Sheet.

## **Resource-Oriented Design**

- **Resources (Nouns)**: Identify key entities (e.g., `users`, `products`, `orders`).
- **Collections (Plural)**: Use plural nouns for collections (e.g., `/users`).
- **Singular Instances**: Use resource identifiers for specific instances (e.g., `/users/{userId}`).
- **Sub-collections**: Represent relationships via nested endpoints (e.g., `/users/{userId}/orders`).

## **HTTP Methods (Verbs)**

- `GET`: Retrieve data (safe, idempotent).
- `POST`: Create new resources.
- `PUT`: Update entire resource.
- `PATCH`: Partially update a resource.
- `DELETE`: Remove a resource (idempotent).

Ensure **idempotency** for `PUT`, `PATCH`, and `DELETE` requests.

## **Naming Conventions**

- **Resource Names**: Use clear, consistent names.
- **Field Names**: Prefer `lowerCamelCase` for JSON fields.
- **URL Paths**: Use lowercase and hyphens where needed.
- **Query Parameters**: Use `lowerCamelCase` (e.g., `pageSize`).

## **Data Formats**

- **JSON**: Preferred request/response format.
- **Date & Time**: Use ISO 8601 (`YYYY-MM-DDTHH:mm:ssZ`).
- **Enums**: Define and use enums for fixed values.

## **Request & Response Structure**

### **Request Example**

```json
{
  "name": "Ally Juma"
}
```

### **Response Example**

```json
{
  "result": [
    { "name": "Ally Juma" },
    { "name": "Ally Juma" }
  ]
}
```

### **Error Response Format**

```json
{
  "code": 400,
  "message": "Invalid request parameters",
  "details": [
    { "field": "email", "error": "Email is required" },
    { "field": "password", "error": "Password must be at least 8 characters" }
  ]
}
```

## **Error Handling**

Use appropriate HTTP status codes:

- `200 OK`: Successful request.
- `201 Created`: Resource created.
- `204 No Content`: Request successful, no response body.
- `400 Bad Request`: Invalid input.
- `401 Unauthorized`: Authentication required.
- `403 Forbidden`: Access denied.
- `404 Not Found`: Resource not found.
- `409 Conflict`: Request conflict.
- `500 Internal Server Error`: Unexpected error.

## **Pagination & Filtering**

### **Pagination Parameters**

- `pageSize`: Number of results per page.
- `pageToken`: Token for the next page.
- Include metadata (e.g., `totalResults`, `nextPageToken`).

### **Pagination Response Example**

```json
{
  "result": [...],
  "pagination": {
    "totalResults": 100,
    "pageSize": 10,
    "currentPage": 1,
    "totalPages": 10,
    "nextPageToken": "abc123"
  }
}
```

### **Filtering & Sorting**

- Filtering: `GET /users?filter[name]=John&filter[status]=active`
- Sorting: `orderBy=name`, `orderBy=name desc`

## **Versioning**

- **URI Path Versioning**: Include version in the path (`/api/v1/`).
- **Header-Based Versioning**: Use `X-API-Version: v1`.

## **Security Best Practices**

- **Authentication**: Implement OAuth 2.0, API keys, JWT.
- **Authorization**: Enforce role-based permissions.
- **HTTPS**: Use TLS for secure communication.
- **Input Validation**: Prevent security vulnerabilities.
- **Rate Limiting**: Protect API from abuse.

## **Documentation**

- Use OpenAPI (Swagger) to define the API contract.
- API docs should be accessible at `/api/v1/docs`.
- Provide examples for searching, filtering, and sorting.
- Include language-specific code samples.

## **RESTful API Specifics**

- **Protocol**: HTTP/1.1 or HTTP/2.
- **Stateless Communication**: Each request is independent.
- **JSON Data Format**: Default response format.
- **Standard HTTP Methods**: Use `GET`, `POST`, `PUT`, `PATCH`, `DELETE`.

## **gRPC API Specifics**

- **Protocol**: Uses HTTP/2.
- **Message Format**: Protocol Buffers (protobuf).
- **Communication Patterns**:
  - Unary (Request-Response)
  - Server Streaming
  - Client Streaming
  - Bidirectional Streaming
- **Performance**: Efficient serialization, lower latency.
- **Strongly Typed Contracts**: Defined in `.proto` files.

## **Key Principles to Follow**

- **Simplicity**: Keep API design intuitive.
- **Consistency**: Follow naming and formatting conventions.
- **Usability**: Design for easy integration and use.
- **Evolvability**: Ensure future changes are non-breaking.
- **Standards Compliance**: Leverage existing best practices.

**By following this guide, Copilot will generate APIs that align with the documented standards, ensuring high-quality, maintainable, and scalable API implementations.** 🚀
