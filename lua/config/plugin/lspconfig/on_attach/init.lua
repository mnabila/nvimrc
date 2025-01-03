return function(client, bufnr)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = { spacing = 2, prefix = "❰" },
  })

  -- if client.supports_method("textDocument/inlayHint") then
  --   vim.lsp.inlay_hint.enable(bufnr, true)
  -- end

  require("config.plugin.lspconfig.on_attach.with_keymap").attach()
end
