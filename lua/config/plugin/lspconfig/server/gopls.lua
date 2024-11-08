local on_attach = require("config.plugin.lspconfig.on_attach")
local capabilities = require("config.plugin.lspconfig.capabilities")

require("lspconfig").gopls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "gopls", "serve" },
  settings = {
    gopls = {
      gofumpt = true,
      analyses = {
        -- Ref: https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
        fieldalignment = false,
        nilness = true,
        shadow = true,
        unusedwrite = true,
        unusedparams = true,
        useany = true,
      },
      staticcheck = true,
      usePlaceholders = false,
      hints = {
        -- Ref: https://github.com/golang/tools/blob/master/gopls/doc/inlayHints.md
        constantValues = true,
        parameterNames = true,
      },
    },
  },
})
