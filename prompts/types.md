---
name: Add Types
interaction: inline
description: Add type annotations to selected code
opts:
  alias: types
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Add type annotations to the provided code using the language's idiomatic type system (e.g. type hints for Python, LuaCATS for Lua, TypeScript types, Go types, Rust types). Keep the logic and structure identical. Only add type information.

## user

Add type annotations to this code:

````${context.filetype}
${context.code}
````
