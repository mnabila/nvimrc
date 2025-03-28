return {
  "nvim-treesitter/nvim-treesitter",
  event = "LspAttach",
  config = function()
    require("plugin.treesitter.setup")
    require("plugin.treesitter.command")
  end,
}
