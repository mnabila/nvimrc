local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

require("lspconfig").pyright.setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
