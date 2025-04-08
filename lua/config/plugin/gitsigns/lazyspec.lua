return {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  config = function()
    require("config.plugin.gitsigns.setup")
  end,
}
