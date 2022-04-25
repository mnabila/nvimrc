local nulls = require("null-ls")

nulls.setup({
    sources = {
        -- formatter
        nulls.builtins.formatting.stylua,
        nulls.builtins.formatting.black,
        nulls.builtins.formatting.fish_indent,
        nulls.builtins.formatting.shfmt,
        nulls.builtins.formatting.pg_format,
        nulls.builtins.formatting.prettierd.with({
            generator_opts = {
                command = "prettierd",
                args = { "$FILENAME" },
                to_stdin = true,
            },
        }),
    },
})

-- keymap
vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, { desc = "LSP: Formats the current buffer" })
vim.keymap.set("v", "<leader>f", vim.lsp.buf.range_formatting, { desc = "LSP: Formats a given range" })
