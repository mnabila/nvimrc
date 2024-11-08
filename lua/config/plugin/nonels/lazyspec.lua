return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("config.plugin.nonels.setup")
    require("config.plugin.nonels.keymap")
  end,
}
