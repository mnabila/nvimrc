return {
  "windwp/nvim-autopairs",
  event = "BufEnter",
  config = function()
    require("config.plugin.autopairs.setup")
  end,
}
