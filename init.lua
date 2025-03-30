-- neovim basic configuration
require("config.option")

-- neovim keybindings
require("config.keymap")

-- custom statusline
require("config.statusline")

-- language server protocol
require("config.lsp")
require("config.lsp.autocmd")
require("config.lsp.diagnostic")

-- neovim package manager
require("config.plugin.setup")
