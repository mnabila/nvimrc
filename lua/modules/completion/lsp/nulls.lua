local nulls = require("null-ls")
local key = require("utils.keymap")

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
key.map("<leader>f", "<CMD>lua vim.lsp.buf.formatting()<CR>")
key.vmap("<leader>f", "<CMD>lua vim.lsp.buf.range_formatting()<CR>")
