return {
  "nvim-treesitter/nvim-treesitter",
  event = "LspAttach",
  config = function()
    require("config.plugin.treesitter.setup")
    require("config.plugin.treesitter.command")
  end,
}
