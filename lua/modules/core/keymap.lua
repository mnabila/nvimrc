local key = require("utils.keymap")

-- disable keys
key.map("Q", "<Nop>")
key.map("<Left>", "<Nop>")
key.map("<Right>", "<Nop>")
key.map("<Up>", "<Nop>")
key.map("<Down>", "<Nop>")
key.map("<C-z>", "<Nop>")

-- resize window
key.map("<C-Left>", "<CMD>vertical resize +5<CR>")
key.map("<C-Up>", "<CMD>resize -5<CR>")
key.map("<C-Right>", "<CMD>vertical resize -5<CR>")
key.map("<C-Down>", "<CMD>resize +5<CR>")

-- split window
key.map("<C-A-k>", "<C-w>t<C-w>K")
key.map("<C-A-h>", "<C-w>t<C-w>H")

-- terminal mode
key.tmap("<Esc>", "<C-\\><C-n>")

-- nvim tree.lua
key.map("`", '<CMD>NvimTreeToggle<CR>')

-- base64
key.vmap("<Leader>d6", "c<C-r>=system('base64 -d', @\")<CR><ESC>")
key.vmap("<Leader>e6", "c<C-r>=system('base64', @\")<CR><ESC>")

-- emmet-vim
key.imap("<A-Tab>", "<C-y>,")
key.vmap("<A-Tab>", "<C-y>,")

-- Delete in search result
key.map("<Leader>x", "<CMD>%s///<CR>")

-- Search for visually selected text
key.vmap("<Leader>v", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")

-- format.nvim
key.map("<leader>F", "<CMD>FormatWrite<CR>")
