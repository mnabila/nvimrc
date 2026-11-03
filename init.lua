-- neovim colorscheme
vim.cmd("colorscheme gruvboy")

-- neovim basic configuration
require("config.option")

-- neovim keybindings
require("config.keymap")

-- language server protocol
require("config.lsp")

-- custom ui bars (statusline + winbar)
require("config.ui.statusline")
require("config.ui.winbar")

-- neovim package manager
require("config.plugin.lazy.setup")
