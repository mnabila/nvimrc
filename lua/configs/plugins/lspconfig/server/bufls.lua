local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

require("lspconfig").bufls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})
