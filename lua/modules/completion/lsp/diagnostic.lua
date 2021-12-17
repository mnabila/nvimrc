vim.diagnostic.config({
    underline = true,
    signs = true,
    virtual_text = { spacing = 8, prefix = "❰" },
    -- virtual_text = false,
    -- float = {
    --     show_header = true,
    --     source = "if_many",
    --     border = "single",
    --     focusable = false,
    -- },
    update_in_insert = true,
    severity_sort = true,
})

-- vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float() ]])
