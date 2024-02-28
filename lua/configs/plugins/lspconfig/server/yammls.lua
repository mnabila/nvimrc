local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

require("lspconfig").yamlls.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		yaml = {
			format = {
				enable = true,
				singleQuote = true,
				bracketSpacing = true,
			},
			editor = {
				tabSize = 2,
			},
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "ci.yml",
				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-speutils.json"] =
				"compose.yml",
			},
		},
	},
})
