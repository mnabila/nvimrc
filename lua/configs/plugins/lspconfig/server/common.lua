local lspconfig = require("lspconfig")
local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

local servers = {
  "bashls",
  "bufls",
  "cssls",
  "dockerls",
  "emmet_language_server",
  "html",
  "jdtls",
  "vimls",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
