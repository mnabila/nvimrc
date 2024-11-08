local on_attach = require("config.plugin.lspconfig.on_attach")
local capabilities = require("config.plugin.lspconfig.capabilities")

return {
  "nvim-java/nvim-java",
  ft = "java",
  config = function()
    require("config.plugin.java.setup")
    require("lspconfig").jdtls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
}
