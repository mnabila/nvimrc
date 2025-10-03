return {
  package = { url = "olimorris/codecompanion.nvim" },
  loader = {
    cmd = {
      "CodeCompanionChat",
      "CodeCompanionCmd",
      "CodeCompanionActions",
    },
  },
  config = function()
    require("config.plugin.codecompanion.setup")
  end,
  deps = {
    { package = { url = "nvim-lua/plenary.nvim" } },
    { package = { url = "nvim-treesitter/nvim-treesitter" } },
  },
}
