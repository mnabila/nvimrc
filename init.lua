-- installMode
-- require("utils.packer").installMode(false)

-- set neovim mapleader
vim.cmd('let mapleader=" "')

-- neovim basic configuration
require("modules.core.settings")

-- neovim package manager
-- require("modules.packer")
require("modules.jetpack")

-- neovim keybindings
require("modules.core.keymap")
