local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

local inlayHints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

require("lspconfig").tsserver.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    -- Ref: https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md
    preferences = {
      quotePreference = "double",
      includeCompletionsWithSnippetText = true,
      generateReturnInDocTemplate = true,
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
    typescript = { inlayHints = inlayHints },
    javascript = { inlayHints = inlayHints },
  },
})
