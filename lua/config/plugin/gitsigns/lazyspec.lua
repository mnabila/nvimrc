return {
  "lewis6991/gitsigns.nvim",
  event = "BufRead",
  config = function()
    require("config.plugin.gitsigns.setup")
  end,
}
