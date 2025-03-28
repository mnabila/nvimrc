return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "natecraddock/telescope-zf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("plugin.telescope.setup")
    require("plugin.telescope.keymap")
  end,
}
