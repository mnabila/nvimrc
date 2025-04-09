-- neovim colorscheme
vim.cmd("colorscheme gruvboy")

-- neovim basic configuration
require("config.option")

-- neovim keybindings
require("config.keymap")

-- language server protocol
require("config.lsp")

-- custom statusbar
require("config.statusbar.statusline")
require("config.statusbar.winbar")

-- neovim package manager
require("config.plugin.setup")
