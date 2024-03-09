return {
  "windwp/nvim-autopairs",
  event = "BufEnter",
  config = function()
    require("configs.plugins.autopairs.setup")
  end,
}
