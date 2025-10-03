return {
  package = { url = "nvim-treesitter/nvim-treesitter" },
  loader = {
    event = { "BufRead", "BufNewFile" },
    cmd = { "TSInstall", "TSUpdate" },
  },
  config = function()
    require("config.plugin.treesitter.setup")
  end,
}
