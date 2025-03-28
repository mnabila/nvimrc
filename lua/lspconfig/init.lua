vim.diagnostic.config({
  underline = true,
  virtual_text = {
    spacing = 2,
    prefix = "❰",
  },
  signs = true,
})

vim.lsp.config("*", {
  capabilities = require("lspconfig.capabilities"),
  on_attach = require("lspconfig.on_attach"),
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
