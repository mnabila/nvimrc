return {
  "saghen/blink.cmp",
  version = "v0.*",
  event = "InsertEnter",
  config = function()
    require("config.plugin.blink.setup")
  end,
}
