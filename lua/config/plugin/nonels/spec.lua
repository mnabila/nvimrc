return {
  package = { source = "nvimtools/none-ls.nvim" },
  loader = { event = "InsertEnter" },
  config = function()
    require("config.plugin.nonels.setup")
    require("config.plugin.nonels.keymap")
  end,
  deps = {
    { package = { source = "nvim-lua/plenary.nvim" } },
  },
}
