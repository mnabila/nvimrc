return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufEnter",
  config = function()
    require("config.plugin.treesitter.setup")
  end,
}
