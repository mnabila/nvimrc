vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    virtual_text = true,
    underline = false,
    update_in_insert = true,
})
