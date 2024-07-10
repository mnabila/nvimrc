local nulls = require("null-ls")

nulls.setup({
  sources = {
    --
    -- FORMATTER
    --
    nulls.builtins.formatting.stylua, -- lua
    nulls.builtins.formatting.black,  -- python
    nulls.builtins.formatting.shfmt,  -- bash,sh,zsh
    nulls.builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "mysql" },
    }), -- sql
    nulls.builtins.formatting.prettierd.with({
      generator_opts = {
        command = "prettierd",
        args = { "$FILENAME" },
        to_stdin = true,
      },
    }),                                   -- css, html, js, json and other stuff (lol)
    nulls.builtins.formatting.goimports,  -- golang
    nulls.builtins.formatting.phpcsfixer, -- php
    nulls.builtins.formatting.buf,        -- proto
  },
})
