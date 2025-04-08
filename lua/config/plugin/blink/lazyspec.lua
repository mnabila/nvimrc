return {
  "saghen/blink.cmp",
  version = "v0.*",
  event = { "WinEnter", "BufEnter" },
  config = function()
    require("config.plugin.blink.setup")
  end,
}
