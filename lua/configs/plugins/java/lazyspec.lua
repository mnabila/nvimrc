local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

return {
  "nvim-java/nvim-java",
  config = function()
    require("configs.plugins.java.setup")

    require("lspconfig").jdtls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
