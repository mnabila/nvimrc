-- experimental feature
vim.loader.enable()

-- set neovim mapleader
vim.g.mapleader = " "

-- neovim basic configuration
require("configs.options")

-- neovim keybindings
require("configs.keymaps")

-- neovim package manager
require("configs.plugins.lazy.setup")
