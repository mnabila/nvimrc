return {
	"nvimtools/none-ls.nvim",
	event = "LspAttach",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("configs.plugins.nonels.setup")
		require("configs.plugins.nonels.keymap")
	end,
}
