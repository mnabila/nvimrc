local on_attach = require("config.plugin.lspconfig.on_attach")
local capabilities = require("config.plugin.lspconfig.capabilities")

require("lspconfig").eslint.setup({
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities = capabilities,
})
