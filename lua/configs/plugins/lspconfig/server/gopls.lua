local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

require("lspconfig").gopls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = { "gopls", "serve" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			usePlaceholders = false,
		},
	},
})
