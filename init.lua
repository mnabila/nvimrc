-- experimental feature
vim.loader.enable()

-- set neovim mapleader
vim.g.mapleader = " "

-- neovim basic configuration
require("configs.options")

-- neovim package manager
require("configs.plugins.lazy.setup")

-- neovim command
require("configs.commands")

-- neovim keybindings
require("configs.keymaps")
