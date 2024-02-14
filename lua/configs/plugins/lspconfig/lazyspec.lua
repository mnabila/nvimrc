return {
    "neovim/nvim-lspconfig",
    dependencies = {
        require("configs.plugins.nonels.lazyspec"),
        require("configs.plugins.trouble.lazyspec"),
        require("configs.plugins.lspsaga.lazyspec"),
    },
    config = function()
         require("configs.plugins.lspconfig.setup")
    end,
}
