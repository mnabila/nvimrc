local lspconfig = require("lspconfig")
local utils = require("configs.plugins.lspconfig.utils")

lspconfig.lua_ls.setup(utils.default({
	cmd = { "lua-language-server", string.format("--logpath=%s/.cache/nvim/sumneko_lua", vim.loop.os_homedir()) },
	root_dir = utils.custom_cwd,
	settings = {
		Lua = {
			runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
			telemetry = {
				enable = false,
			},
			diagnostics = {
				enable = true,
				globals = { "vim", "awesome", "use", "client", "root", "s", "screen" },
			},
		},
	},
}))

lspconfig.gopls.setup(utils.default({
	cmd = { "gopls", "serve" },
	root_dir = utils.custom_cwd,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			usePlaceholders = false,
		},
	},
}))

lspconfig.yamlls.setup(utils.default({
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
}))

lspconfig.emmet_ls.setup(utils.default({
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
}))

local servers = { "dockerls", "bashls", "vimls", "cssls", "bufls", "tsserver", "jdtls", "html" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup(utils.default())
end
