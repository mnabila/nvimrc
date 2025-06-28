return {
  package = { source = "j-hui/fidget.nvim" },
  loader = { event = "LspAttach" },
  config = function()
    require("config.plugin.fidget.setup")
  end,
}
