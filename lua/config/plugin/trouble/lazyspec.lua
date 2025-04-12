return {
  "folke/trouble.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  cmd = "Trouble",
  init = function()
    require("config.plugin.trouble.keymap")
  end,
  config = function()
    require("config.plugin.trouble.setup")
  end,
}
