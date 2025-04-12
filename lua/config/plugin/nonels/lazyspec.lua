return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "InsertEnter",
  config = function()
    require("config.plugin.nonels.setup")
    require("config.plugin.nonels.keymap")
  end,
}
