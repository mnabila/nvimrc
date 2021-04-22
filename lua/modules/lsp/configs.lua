local configs = require("lspconfig/configs")

configs.emmet_ls = {
    default_config = {
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "html", "css", "javascript", "javascriptreact" },
        root_dir = vim.loop.cwd,
        settings = {},
    },
}
