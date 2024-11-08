local lspconfig = require("lspconfig")
local on_attach = require("config.plugin.lspconfig.on_attach")
local capabilities = require("config.plugin.lspconfig.capabilities")

local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "html",
  "vimls",
  "pyright",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
