return {
  package = { url = "mfussenegger/nvim-lint" },
  loader = { event = { "BufReadPost", "BufNewFile" } },
  config = function()
    require("config.plugin.nvim_lint.setup")
  end,
}
