---
name: Extract Function
interaction: inline
description: Extract selected code into a well-named function
opts:
  alias: extract
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Extract the provided code into a well-named function. Choose a clear, descriptive function name based on what the code does. Add appropriate parameters for any external dependencies. Replace the original code with a call to the new function. Place the function definition directly above the call site.

## user

Extract this code into a function:

````${context.filetype}
${context.code}
````
