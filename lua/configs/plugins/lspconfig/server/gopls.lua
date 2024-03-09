local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

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
        assignVariableTypes = true,
        compositeLiteralFields = true,
        constantValues = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
