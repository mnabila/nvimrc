-- neovim basic configuration
require('settings')
require('keybindings')

-- neovim modules
require('modules.colors.gruvbox')
require('modules.statusline.init')

-- neovim plugins for user interface
require('plugins.barbar')
require('plugins.gruvbox')
require('plugins.hexokinase')
require('plugins.indentLine')
require('plugins.treesitter')
require('plugins.nvimTree')
require('plugins.telescope')

-- neovim plugins for functionality
require('plugins.translator')
require('plugins.header')

-- neovim language support
require('plugins.markdown')

-- neovim git{_,hub} support
require('plugins.signify')
require('plugins.gist')

-- neovim code completion and code formater
require('modules.lsp.init')
require('plugins.completion')
require('plugins.codeformatter')
