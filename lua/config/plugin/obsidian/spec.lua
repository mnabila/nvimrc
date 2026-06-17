return {
  package = { url = "obsidian-nvim/obsidian.nvim", version = "*" },
  config = function()
    require("config.plugin.obsidian.setup")
  end,
  deps = {
    { package = { url = "nvim-lua/plenary.nvim" } },
    { package = { url = "nvim-telescope/telescope.nvim" } },
  },
}
