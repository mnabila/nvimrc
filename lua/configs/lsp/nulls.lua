local nulls = require("null-ls")

nulls.setup({
    -- diagnostic_config = {
    --     underline = true,
    --     signs = false,
    --     virtual_text = { spacing = 4, prefix = "❰" },
    -- },
    sources = {
        --
        -- FORMATTER
        --
        nulls.builtins.formatting.stylua, -- lua
        nulls.builtins.formatting.black, -- python
        nulls.builtins.formatting.shfmt, -- bash,sh,zsh
        nulls.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "postgres" },
        }), -- postgresql
        nulls.builtins.formatting.prettierd.with({
            generator_opts = {
                command = "prettierd",
                args = { "$FILENAME" },
                to_stdin = true,
            },
        }), -- css, html, js, json and other stuff (lol)
        nulls.builtins.formatting.goimports, -- golang
        nulls.builtins.formatting.phpcsfixer, -- php
        nulls.builtins.formatting.buf, -- proto

        --
        -- DIAGNOSTICS
        --
        -- nulls.builtins.diagnostics.sqlfluff.with({
        --     extra_args = { "--dialect", "postgres" },
        -- }), -- postgres

        nulls.builtins.diagnostics.eslint, -- javascript, typescript
        -- nulls.builtins.diagnostics.buf, -- proto
    },
})

local function format()
    vim.lsp.buf.format({ async = true })
end

-- keymap
vim.keymap.set("n", "<leader>f", format, { desc = "LSP: Formats the current buffer" })
