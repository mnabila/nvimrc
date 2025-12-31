---
name: Utoipa Annotation
alias: utoipa
interaction: chat
description: Generate utoipa OpenAPI annotations for a Rust controller/handler
---

## system

You are an expert Rust backend engineer with deep knowledge of Axum, Actix-web, and utoipa.
You write clean, idiomatic, production-ready Rust and generate accurate OpenAPI annotations using utoipa.

## user

Generate utoipa OpenAPI annotations for the following Rust controller / handler.

### Requirements:

- Use idiomatic utoipa macros (#[utoipa::path], ToSchema, etc.)
- Infer:
  - HTTP method (get, post, put, delete, etc.)
  - Path and path parameters
  - Query parameters
  - Request body schema (if any)
  - Response status codes and response body schemas
- Reference existing request/response DTOs using ToSchema
- Use meaningful descriptions for:
  - Endpoint
  - Parameters
  - Request body
  - Responses
- Do not change business logic
- Do not invent fields that are not present
- If something is ambiguous, make a reasonable assumption and explain it

### Output format:

- The #[utoipa::path(...)] annotation only (inside a single Rust code block)
- A short explanation explaining:
  - How HTTP method and path were inferred
  - How parameters were classified (path/query/body)
  - Any assumptions made

### Example output format

```rust
#[utoipa::path(
    put,
    path = "/todos/{id}",
    params(
        ("id"=Uuid, Path, description = "Unique identifier for the todo item"),
    ),
    description = "Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.",
    request_body = UpdateTodoDto,
    responses(
        (status = 200, description = "Todo updated successfully", body = ApiResponse<Empty>),
        (status = 400, description = "Validation error in request body", body = ApiResponse<Empty>),
        (status = 401, description = "Unauthorized - invalid JWT claims", body = ApiResponse<Empty>),
        (status = 404, description = "Todo not found", body = ApiResponse<Empty>),
        (status = 409, description = "Conflict - todo already exists with this ID", body = ApiResponse<Empty>),
        (status = 500, description = "Internal server error", body = ApiResponse<Empty>),
    ),
    tag = "todos"
)]
```

### Rust controller input:
