local configs = require('lspconfig/configs')

configs.emmet_ls = {
    default_config = {
        cmd = {'emmet-ls', '--stdio'},
        filetypes = {'html', 'css'},
        root_dir = function()
            return vim.loop.cwd()
        end;
        settings = {},
    }
}
