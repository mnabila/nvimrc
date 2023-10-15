-- set neovim mapleader
vim.g.mapleader = " "

-- neovim basic configuration
require("configs.core.settings")

-- neovim package manager
require("configs.plugins")

-- neovim command
require("configs.core.command")

-- neovim keybindings
require("configs.core.keymap")
