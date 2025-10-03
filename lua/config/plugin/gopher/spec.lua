return {
  package = { url = "olexsmir/gopher.nvim" },
  loader = { ft = { "go" } },
  config = function()
    require("config.plugin.gopher.setup")
  end,
}
