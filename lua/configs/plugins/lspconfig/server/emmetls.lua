local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

require("lspconfig").emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = {
		"html",
		"typescriptreact",
		"javascriptreact",
		"javascript",
		"css",
		"sass",
		"scss",
		"less",
		"gohtmltmpl",
	},
})
