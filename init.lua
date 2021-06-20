-- neovim basic configuration
require('settings')

-- install packer
require('modules.packer.bootstrapping')

-- neovim package manager
require('modules.packer')

-- neovim plugins for user interface
-- require('plugins.barbar')
-- require('plugins.indentline')
-- require('plugins.treesitter')
-- require('plugins.nvimtree')
-- require('plugins.galaxyline')
-- require('plugins.neoscroll')

-- neovim plugins for functionality
-- require('plugins.translator')
-- require('plugins.header')
-- require('plugins.telescope')
-- require('plugins.autopairs')
-- require('plugins.comment')
-- require('plugins.biscuits')

-- neovim language support
-- require('plugins.markdown')

-- neovim git{_,hub} support
-- require('plugins.gitsigns')
-- require('plugins.gist')
-- require('plugins.neogit')

-- neovim code completion and code formater
require('modules.lsp')
-- require('plugins.completion')
-- require('plugins.formatter')
-- require('plugins.aerial')

-- neovim keybindings
require('keybindings')

