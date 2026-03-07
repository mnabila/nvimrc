---
name: Buffer Inline
interaction: inline
description: Send the current buffer as context with your prompt
opts:
  alias: buffer
  is_slash_cmd: false
  user_prompt: true
  modes:
    - v
    - n
---

## system

I want you to act as a senior ${context.filetype} developer. I will give you code as context and ask you to make changes. Return raw code only (no codeblocks and no explanations). If you can't respond with code, respond with nothing.

## user

Here is the code from buffer ${context.bufnr}:

````${context.filetype}
${context.code}
````
