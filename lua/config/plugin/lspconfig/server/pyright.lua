local on_attach = require("config.plugin.lspconfig.on_attach")
local capabilities = require("config.plugin.lspconfig.capabilities")

require("lspconfig").pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
