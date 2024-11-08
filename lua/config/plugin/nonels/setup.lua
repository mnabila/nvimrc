local nulls = require("null-ls")

nulls.setup({
  sources = {
    -- lua
    nulls.builtins.formatting.stylua,

    -- python
    nulls.builtins.formatting.black,

    -- bash,sh,zsh
    nulls.builtins.formatting.shfmt,

    -- sql
    nulls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "mysql" },
    }),

    -- css, html, js, json and other stuff (lol)
    nulls.builtins.formatting.prettierd,

    -- golang
    nulls.builtins.formatting.goimports,

    -- php
    nulls.builtins.formatting.phpcsfixer,

    -- proto
    nulls.builtins.formatting.buf,
  },
})
