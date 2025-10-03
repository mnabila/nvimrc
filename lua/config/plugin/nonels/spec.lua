return {
  package = { url = "nvimtools/none-ls.nvim" },
  loader = { event = "InsertEnter" },
  config = function()
    require("config.plugin.nonels.setup")
  end,
  deps = {
    { package = { url = "nvim-lua/plenary.nvim" } },
  },
}
