return {
  "neovim/nvim-lspconfig",
  dependencies = {
    require("config.plugin.lspsaga.lazyspec"),
    require("config.plugin.nonels.lazyspec"),
    require("config.plugin.trouble.lazyspec"),
  },
  config = function()
    local windows = require("lspconfig.ui.windows")
    windows.default_options.border = "single"

    require("config.plugin.lspconfig.server.common")
    require("config.plugin.lspconfig.server.gopls")
    require("config.plugin.lspconfig.server.luals")
    require("config.plugin.lspconfig.server.tsls")
    require("config.plugin.lspconfig.server.yammls")
    require("config.plugin.lspconfig.server.emmet_language_server")
  end,
}
