return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
    end,
  },
  config = function()
    require("mason").setup({
      ui = {
        border = "single",
        width = 0.8,
        height = 0.8,
      },
    })
  end,
}
