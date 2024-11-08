local on_attach = require("config.plugin.lspconfig.on_attach")
local capabilities = require("config.plugin.lspconfig.capabilities")

require("lspconfig").emmet_language_server.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = {
    "css",
    "html",
    "javascriptreact",
    "sass",
    "scss",
    "typescriptreact",
    "svelte",
  },
})
