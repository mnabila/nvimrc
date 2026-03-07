---
name: Split Function
interaction: inline
description: Break a large function into smaller, focused functions
opts:
  alias: split
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Break the provided function into smaller, well-named helper functions that each do one thing. Each extracted function should have a clear single responsibility. Keep the original function as the entry point that delegates to the helpers. Preserve the original function's public interface (name, parameters, return type).

## user

Split this function into smaller functions:

````${context.filetype}
${context.code}
````
