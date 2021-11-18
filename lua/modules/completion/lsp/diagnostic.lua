vim.diagnostic.config({
    underline = false,
    signs = true,
    -- virtual_text = { spacing = 8, prefix = "❰" },
    virtual_text = false,
    float = {
        show_header = true,
        source = "if_many",
        border = "single",
        focusable = false,
    },
    update_in_insert = true,
    severity_sort = false,
})

vim.cmd([[ autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics() ]])
