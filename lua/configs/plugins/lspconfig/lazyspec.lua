return {
  "neovim/nvim-lspconfig",
  dependencies = {
    require("configs.plugins.nonels.lazyspec"),
    require("configs.plugins.trouble.lazyspec"),
    require("configs.plugins.lspsaga.lazyspec"),
  },
  config = function()
    require("configs.plugins.lspconfig.server.common")
    require("configs.plugins.lspconfig.server.emmetls")
    require("configs.plugins.lspconfig.server.gopls")
    require("configs.plugins.lspconfig.server.luals")
    require("configs.plugins.lspconfig.server.yammls")
    require("configs.plugins.lspconfig.server.tsserver")
    require("configs.plugins.lspconfig.server.bufls")
    require("configs.plugins.lspconfig.server.pyright")
  end,
}
