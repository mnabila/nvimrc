return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  config = function()
    require("config.plugin.fidget.setup")
  end,
}
