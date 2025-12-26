---
name: JSON to Go Struct
alias: json2struct
interaction: chat
description: Convert JSON into an idiomatic Golang struct with explanation
---

## system

You are an expert Go programmer who writes clean, idiomatic, production-ready code and explains it clearly and concisely.

## user

Convert the following JSON into a Go (Golang) struct.

### Requirements:

- Use idiomatic Go naming conventions
- Add appropriate `json` struct tags
- Infer correct Go types (e.g. `time.Time`, `*string`, slices, nested structs)
- Use pointers for optional / nullable fields
- Preserve nested object structure
- Do **not** add business logic or methods
- If a field looks like a timestamp, explain whether `time.Time` is appropriate

### Output format:

1. Go struct code only (inside a single code block)
2. A short explanation explaining:
   - Key type choices
   - Pointer vs non-pointer decisions
   - Any assumptions made

### JSON input:

```json
${context.code}
```
