return {
  package = { url = "OXY2DEV/markview.nvim" },
  loader = { ft = { "markdown", "codecompanion" } },
  config = function()
    require("config.plugin.markview.setup")
  end,
}
