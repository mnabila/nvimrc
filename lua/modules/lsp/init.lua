require('modules.lsp.langserver')
require('modules.lsp.settings')
require('modules.lsp.keybindings')

-- attach completion-nvim and diagnostic for every filetype
vim.cmd('au BufEnter * lua require("diagnostic").on_attach()')
vim.cmd('au BufEnter * lua require("completion").on_attach()')



