return {
  package = { url = "MeanderingProgrammer/render-markdown.nvim" },
  loader = { ft = { "markdown", "codecompanion" } },
  config = function()
    require("config.plugin.markdown.setup")
  end,
}
