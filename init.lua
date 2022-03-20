-- set neovim mapleader
vim.g.mapleader = " "

-- neovim basic configuration
require("modules.core.settings")

-- neovim package manager
require("modules.jetpack")

-- neovim keybindings
require("modules.core.keymap")
