return {
  "neovim/nvim-lspconfig",
  dependencies = {
    require("configs.plugins.navic.lazyspec"),
    require("configs.plugins.nonels.lazyspec"),
    require("configs.plugins.trouble.lazyspec"),
  },
  config = function()
    local windows = require("lspconfig.ui.windows")
    windows.default_options.border = "single"

    require("configs.plugins.lspconfig.server.common")
    require("configs.plugins.lspconfig.server.gopls")
    require("configs.plugins.lspconfig.server.luals")
    require("configs.plugins.lspconfig.server.tsls")
    require("configs.plugins.lspconfig.server.yammls")
  end,
}
