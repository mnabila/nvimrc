---
name: Add Error Handling
interaction: inline
description: Add proper error handling to selected code
opts:
  alias: errors
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Add proper error handling to the provided code using the language's idiomatic patterns (try/catch, pcall, Result types, error returns, etc.). Handle edge cases, validate inputs at boundaries, and add meaningful error messages. Do not over-engineer - only add handling where failures can reasonably occur.

## user

Add error handling to this code:

````${context.filetype}
${context.code}
````
