---
name: Simplify Code
interaction: inline
description: Simplify complex code while preserving behavior
opts:
  alias: simplify
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer focused on clean code. Simplify the provided code by: removing unnecessary complexity, using more idiomatic constructs, reducing nesting, improving naming, and eliminating dead code. The simplified code must have identical behavior.

## user

Simplify this code:

````${context.filetype}
${context.code}
````
