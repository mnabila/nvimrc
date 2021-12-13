-- set neovim mapleader
vim.cmd('let mapleader=" "')

-- neovim basic configuration
require("modules.core.settings")

-- neovim package manager
require("modules.packer")

-- neovim keybindings
require("modules.core.keymap")
