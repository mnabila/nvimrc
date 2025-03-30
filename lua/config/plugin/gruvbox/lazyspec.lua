return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  init = function()
    vim.opt.bg = "dark"
  end,
  config = function()
    require("config.plugin.gruvbox.setup")
  end,
}
