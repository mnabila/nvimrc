local nulls = require("null-ls")

nulls.setup({
    sources = {
        -- formatter
        nulls.builtins.formatting.stylua,
        nulls.builtins.formatting.black,
        nulls.builtins.formatting.fish_indent,
        nulls.builtins.formatting.shfmt,
        nulls.builtins.formatting.prettier,
    },
})

-- keymap
vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting)
vim.keymap.set("v", "<leader>f", vim.lsp.buf.range_formatting)
