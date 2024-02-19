return {
	"nvim-treesitter/nvim-treesitter",
	event = "LspAttach",
	config = function()
		require("configs.plugins.treesitter.setup")
		require("configs.plugins.treesitter.command")
	end,
}
