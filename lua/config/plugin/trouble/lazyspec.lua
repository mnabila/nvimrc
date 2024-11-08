return {
  "folke/trouble.nvim",
  event = "LspAttach",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("config.plugin.trouble.setup")
  end,
}
