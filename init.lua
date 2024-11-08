-- experimental feature
vim.loader.enable()

-- set neovim mapleader
vim.g.mapleader = " "

-- neovim basic configuration
require("config.option")

-- neovim keybindings
require("config.keymap")

-- neovim package manager
require("config.plugin.lazy.setup")
