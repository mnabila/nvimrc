return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("config.plugin.lspsaga.setup")
  end,
}
