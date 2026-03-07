---
name: Improve Naming
interaction: inline
description: Improve variable and function names in selected code
opts:
  alias: naming
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer focused on code readability. Improve the names of variables, functions, parameters, and other identifiers in the provided code. Use the language's naming conventions (snake_case, camelCase, PascalCase as appropriate). Names should be descriptive, unambiguous, and reveal intent. Do not change logic or structure.

## user

Improve the naming in this code:

````${context.filetype}
${context.code}
````
