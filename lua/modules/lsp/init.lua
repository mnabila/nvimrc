require('modules.lsp.langserver')
require('modules.lsp.diagnostic')
require('modules.lsp.keybindings')

-- attach completion-nvim and diagnostic for every filetype
vim.cmd('au BufEnter * lua require("completion").on_attach()')
