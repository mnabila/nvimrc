local on_attach = require("configs.plugins.lspconfig.on_attach")
local capabilities = require("configs.plugins.lspconfig.capabilities")

require("lspconfig").lua_ls.setup({
	cmd = { "lua-language-server", string.format("--logpath=%s/.cache/nvim/sumneko_lua", vim.loop.os_homedir()) },
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
})
