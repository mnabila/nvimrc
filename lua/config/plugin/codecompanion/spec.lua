return {
  package = { source = "olimorris/codecompanion.nvim" },
  loader = {
    cmd = {
      "CodeCompanionChat",
      "CodeCompanionCmd",
      "CodeCompanionAction",
    },
  },
  config = function()
    require("config.plugin.codecompanion.setup")
  end,
  deps = {
    { package = { source = "nvim-lua/plenary.nvim" } },
    { package = { source = "nvim-treesitter/nvim-treesitter" } },
  },
}
