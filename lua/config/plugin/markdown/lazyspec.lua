return {
  "MeanderingProgrammer/render-markdown.nvim",
  ft = { "markdown", "codecompanion" },
  config = function()
    require("config.plugin.markdown.setup")
  end,
}
