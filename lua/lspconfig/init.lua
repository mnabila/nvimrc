local capabilities = require("lspconfig.capabilities")

vim.diagnostic.config({
  underline = true,
  virtual_text = {
    spacing = 2,
    prefix = "❰",
  },
  signs = true,
})

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.lsp.enable({
  "bashls",
  "cssls",
  "dockerls",
  "emmetls",
  "gopls",
  "luals",
  "tsls",
  "vimls",
})
