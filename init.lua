-- set neovim mapleader
vim.g.mapleader = " "

-- neovim basic configuration
require("configs.core.settings")

-- neovim package manager
require("configs.plugins")

-- neovim keybindings
require("configs.core.keymap")

-- neovim user command
require("configs.core.command")
