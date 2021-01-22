-- neovim basic configuration
require('settings')

-- install packer
require('modules.packer.bootstrapping')

-- neovim package manager
require('modules.packer')

-- neovim modules
require('modules.colors.gruvbox')
require('modules.statusline')

-- neovim plugins for user interface
require('plugins.barbar')
require('plugins.gruvbox')
require('plugins.hexokinase')
require('plugins.indentLine')
require('plugins.treesitter')
require('plugins.nvimTree')

-- neovim plugins for functionality
require('plugins.translator')
require('plugins.header')
require('plugins.telescope')

-- neovim language support
require('plugins.markdown')

-- neovim git{_,hub} support
require('plugins.signify')
require('plugins.gist')

-- neovim code completion and code formater
require('modules.lsp')
require('plugins.completion')
require('plugins.codeformatter')
require('plugins.emmet')

-- neovim keybindings
require('keybindings')
