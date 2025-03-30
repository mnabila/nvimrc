return {
  "nvim-treesitter/nvim-treesitter",
  event = "LspAttach",
  config = function()
    require("config.plugin.treesitter.setup")
  end,
}
