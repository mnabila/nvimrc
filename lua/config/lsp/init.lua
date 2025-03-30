vim.lsp.config("*", {
  capabilities = require("config.lsp.capabilities"),
  on_attach = require("config.lsp.on_attach"),
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
  "pyright",
})
