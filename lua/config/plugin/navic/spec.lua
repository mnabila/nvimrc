return {
  package = { source = "SmiteshP/nvim-navic" },
  loader = { event = "LspAttach" },
  config = function()
    require("config.plugin.navic.setup")
  end,
}
