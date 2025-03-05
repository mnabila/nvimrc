return function()
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({ border = "single" })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.hover({ border = "single" })

  -- if client.supports_method("textDocument/inlayHint") then
  --   vim.lsp.inlay_hint.enable(bufnr, true)
  -- end

  require("config.plugin.lspconfig.on_attach.with_keymap").attach()
end
