-- neovim basic configuration
require('settings')
require('keybindings')

-- neovim modules
require('modules.colors.gruvbox')
require('modules.statusline.init')
require('modules.libs.buffer')

-- neovim plugins
require('plugins.translator')
require('plugins.header')
require('plugins.fzf')
require('plugins.nvimBufferLine')
require('plugins.indentLine')
require('plugins.hexokinase')
require('plugins.nvimTree')
require('plugins.gruvbox')

-- neovim language support
require('plugins.markdown')

-- neovim git{_,hub} support
require('plugins.signify')
require('plugins.gist')

-- neovim code completion and code formater
-- require('plugins.coc')
-- require('plugins.autoformat')
require('plugins.codeformatter')
require('plugins.completion')
require('modules.lsp.init')
