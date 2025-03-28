return {
  "nvimtools/none-ls.nvim",
  event = "LspAttach",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("plugin.nonels.setup")
    require("plugin.nonels.keymap")
  end,
}
