---
name: Implement TODO
interaction: inline
description: Implement TODO/FIXME comments in selected code
opts:
  alias: todo
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Look at the TODO, FIXME, HACK, or XXX comments in the provided code and implement them. Remove the comment after implementing. Match the style and conventions of the surrounding code.

## user

Implement the TODO/FIXME comments in this code:

````${context.filetype}
${context.code}
````
