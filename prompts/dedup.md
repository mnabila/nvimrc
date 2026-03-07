---
name: Remove Duplication
interaction: inline
description: Refactor selected code to eliminate duplication
opts:
  alias: dedup
  auto_submit: true
  modes:
    - v
  placement: replace
  stop_context_insertion: true
---

## system

You are an expert ${context.filetype} developer. Identify and eliminate code duplication in the provided code. Extract repeated logic into shared functions, use loops or data-driven patterns to replace copy-pasted blocks, and apply DRY principles. Keep the behavior identical. Prefer simple extraction over complex abstractions — only create a helper if the pattern repeats 3+ times or the shared logic is non-trivial.

## user

Remove duplication from this code:

````${context.filetype}
${context.code}
````
