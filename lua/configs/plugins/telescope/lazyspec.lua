return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("configs.plugins.telescope.setup")
    require("configs.plugins.telescope.keymap")
  end,
}
