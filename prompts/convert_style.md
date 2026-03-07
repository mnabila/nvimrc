---
name: Convert Code Style
interaction: inline
description: Ask for a target style/pattern to convert selected code
opts:
  alias: convert
  auto_submit: false
  user_prompt: "Convert to what? (e.g. class to functions, loops to map/filter, OOP to FP): "
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Convert the provided code according to the user's request while preserving identical behavior. Match the surrounding code style.

## user

Here is the code to convert:

````${context.filetype}
${context.code}
````
