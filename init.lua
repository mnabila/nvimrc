-- neovim basic configuration
require('settings')

-- install packer
require('modules.packer.bootstrapping')

-- neovim package manager
require('modules.packer')

-- neovim plugins for user interface
require('plugins.barbar')
require('plugins.hexokinase')
require('plugins.indentLine')
require('plugins.treesitter')
require('plugins.nvimTree')
require('modules.statusline')

-- neovim plugins for functionality
require('plugins.translator')
require('plugins.header')
require('plugins.telescope')
require('plugins.autopairs')

-- neovim language support
require('plugins.markdown')

-- neovim git{_,hub} support
require('plugins.gitsigns')
require('plugins.gist')

-- neovim code completion and code formater
require('modules.lsp')
require('plugins.completion')
require('plugins.codeformatter')

-- colorscheme
require('modules.colors.gruvbox')
require('plugins.gruvbox')

-- neovim keybindings
require('keybindings')

