return {
  package = { url = "lewis6991/gitsigns.nvim" },
  loader = { event = "BufRead" },
  config = function()
    require("config.plugin.gitsigns.setup")
  end,
}
