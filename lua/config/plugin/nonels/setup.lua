local nulls = require("null-ls")

nulls.setup({
  sources = {
    -- lua
    nulls.builtins.formatting.stylua,
    nulls.builtins.diagnostics.selene,

    -- python
    nulls.builtins.formatting.black,

    -- bash,sh,zsh
    nulls.builtins.formatting.shfmt,

    -- sql
    nulls.builtins.formatting.sqruff,
    nulls.builtins.diagnostics.sqruff,

    -- css, html, js, json and other stuff (lol)
    nulls.builtins.formatting.prettier,

    -- golang
    nulls.builtins.formatting.goimports,

    -- php
    nulls.builtins.formatting.phpcsfixer,

    -- proto
    nulls.builtins.formatting.buf,
    nulls.builtins.diagnostics.buf,
  },
})
