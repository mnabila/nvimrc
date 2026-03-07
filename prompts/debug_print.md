---
name: Add Debug Prints
interaction: inline
description: Add debug print/log statements to selected code
opts:
  alias: debug
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Add debug print/log statements to the provided code to help trace execution flow and inspect variable values. Use the language's idiomatic logging (print, console.log, log.debug, fmt.Println, etc.). Add prints at: function entry/exit with arguments and return values, before/after key operations, and inside conditionals to show which branch was taken. Prefix each print with a meaningful label.

## user

Add debug prints to this code:

````${context.filetype}
${context.code}
````
