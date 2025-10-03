return {
  package = { url = "folke/trouble.nvim" },
  loader = { cmd = "Trouble" },
  init = function()
    require("config.plugin.trouble.keymap")
  end,
  config = function()
    require("config.plugin.trouble.setup")
  end,
  deps = {
    { package = { url = "nvim-tree/nvim-web-devicons" } },
    { package = { url = "nvim-telescope/telescope.nvim" } },
  },
}
