-- before execute PackerInstall, 
-- make sure you change installMode to true,
-- after finish installation revert to false. 
-- if installMode value is true
-- all configuration in this nvimrc not loaded
_G.InstallMode = false

-- set neovim mapleader
vim.g.mapleader = " "

-- neovim basic configuration
require("configs.core.settings")

-- neovim package manager
require("configs.packer")

-- neovim keybindings
require("configs.core.keymap")

-- neovim user command
require("configs.core.command")
