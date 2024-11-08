return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    {
      "hrsh7th/cmp-vsnip",
      dependencies = "hrsh7th/vim-vsnip",
      init = function()
        vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
      end,
    },
    require("config.plugin.autopairs.lazyspec"),
  },
  config = function()
    require("config.plugin.cmp.setup")
  end,
}
