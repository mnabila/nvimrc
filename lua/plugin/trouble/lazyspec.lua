return {
  "folke/trouble.nvim",
  event = "LspAttach",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("plugin.trouble.setup")
  end,
}
