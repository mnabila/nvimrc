return {
	"dinhhuy258/sfm.nvim",
	dependencies = {
		"dinhhuy258/sfm-filter.nvim",
	},
	config = function()
		require("configs.plugins.sfm.setup")
		require("configs.plugins.sfm.keymap")
	end,
}
