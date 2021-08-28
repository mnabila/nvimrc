vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    virtual_text = { spacing = 4, prefix = "❰" },
    underline = false,
    update_in_insert = true,
})

local signs = {
    { highlight = "LspDiagnosticsSignError", sign = "▊" },
    { highlight = "LspDiagnosticsSignWarning", sign = "▊" },
    { highlight = "LspDiagnosticsSignInformation", sign = "▊" },
    { highlight = "LspDiagnosticsSignHint", sign = "▊" },
}

for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.highlight, { text = sign.sign, texthl = sign.highlight, linehl = "NONE" })
end
