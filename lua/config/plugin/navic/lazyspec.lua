return {
  "SmiteshP/nvim-navic",
  event = "LspAttach",
  config = function()
    require("config.plugin.navic.setup")
  end,
}
