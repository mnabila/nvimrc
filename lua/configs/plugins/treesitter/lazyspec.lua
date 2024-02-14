return {
	"nvim-treesitter/nvim-treesitter",
	event = "LspAttach",
	config = function()
		require("configs.plugins.treesitter.setup")
	end,
}
