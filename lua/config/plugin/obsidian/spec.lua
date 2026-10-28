return {
  package = { url = "obsidian-nvim/obsidian.nvim", version = "*" },
  loader = {
    cmd = "Obsidian",
    keys = {
      { "<Leader>n", "<cmd>Obsidian<cr>", desc = "Obsidian" },
    },
  },
  config = function()
    require("config.plugin.obsidian.setup")
  end,
  deps = {
    { package = { url = "nvim-lua/plenary.nvim" } },
    { package = { url = "nvim-telescope/telescope.nvim" } },
  },
}
