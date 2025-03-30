return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  cmd = {
    "CodeCompanionChat",
    "CodeCompanionCmd",
    "CodeCompanionAction",
  },
  config = function()
    require("config.plugin.codecompanion.setup")
  end,
}
