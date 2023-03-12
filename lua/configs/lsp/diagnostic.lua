vim.diagnostic.config({
    underline = true,
    signs = false,
    virtual_text = { spacing = 4, prefix = "❰" },
    -- virtual_text = false,
    -- float = {
    --     show_header = true,
    --     source = "if_many",
    --     border = "single",
    --     focusable = false,
    -- },
    update_in_insert = false,
    severity_sort = true,
})

-- vim.cmd([[ autocmd CursorHold * lua vim.diagnostic.open_float() ]])

local signs = {
    Error = "",
    Warn = "",
    Hint = "",
    Info = "",
}
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {
        text = icon,
        texthl = hl,
    })
end
