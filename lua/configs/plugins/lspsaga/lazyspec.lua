return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("configs.plugins.lspsaga.setup")
  end,
}
