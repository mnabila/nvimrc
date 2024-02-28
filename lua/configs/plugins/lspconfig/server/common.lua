local lspconfig = require("lspconfig")
local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

local servers = { "dockerls", "bashls", "vimls", "cssls", "bufls", "tsserver", "jdtls", "html" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
