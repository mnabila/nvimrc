return {
  "https://gitlab.com/itaranto/preview.nvim",
  cmd = "PreviewFile",
  config = function()
    require("config.plugin.preview.setup")
  end,
}
