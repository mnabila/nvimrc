local nulls = require("null-ls")
local helpers = require("null-ls.helpers")

local kdlfmt = helpers.make_builtin({
  name = "kdlfmt",
  meta = { url = "https://github.com/nickel-lang/kdlfmt" },
  method = nulls.methods.FORMATTING,
  filetypes = { "kdl" },
  generator_opts = {
    command = "kdlfmt",
    args = { "format", "-" },
    to_stdin = true,
  },
  factory = helpers.formatter_factory,
})

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

    kdlfmt,
  },
})
