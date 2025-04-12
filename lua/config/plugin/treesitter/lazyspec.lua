return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufRead", "BufNewFile" },
  cmd = { "TSInstall", "TSUpdate" },
  config = function()
    require("config.plugin.treesitter.setup")
  end,
}
