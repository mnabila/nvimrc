---
name: Convert to Async
interaction: inline
description: Convert synchronous code to async/concurrent pattern
opts:
  alias: async
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Convert the provided synchronous code to use the language's async/concurrent pattern (async/await, coroutines, goroutines, promises, callbacks, etc.). Maintain the same logic and error handling. Use the most idiomatic async pattern for the language.

## user

Convert this code to async:

````${context.filetype}
${context.code}
````
