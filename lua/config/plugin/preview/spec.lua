return {
  package = { url = "https://gitlab.com/itaranto/preview.nvim" },
  loader = { cmd = "PreviewFile" },
  config = function()
    require("config.plugin.preview.setup")
  end,
}
