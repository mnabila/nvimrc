return {
  package = { source = "folke/trouble.nvim" },
  loader = { cmd = "Trouble" },
  init = function()
    require("config.plugin.trouble.keymap")
  end,
  config = function()
    require("config.plugin.trouble.setup")
  end,
  deps = {
    { package = { source = "nvim-tree/nvim-web-devicons" } },
    { package = { source = "nvim-telescope/telescope.nvim" } },
  },
}
