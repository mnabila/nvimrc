return {
  package = { url = "folke/snacks.nvim" },
  loader = { lazy = false, priority = 1000 },
  init = function()
    require("config.plugin.snacks.keymap")
  end,
  config = function()
    require("config.plugin.snacks.setup")
  end,
}
