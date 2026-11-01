return {
  package = { url = "stevearc/conform.nvim" },
  loader = { event = "BufWritePre" },
  config = function()
    require("config.plugin.conform.setup")
    require("config.plugin.conform.keymap")
  end,
  deps = {
    { package = { url = "nvim-lua/plenary.nvim" } },
  },
}
