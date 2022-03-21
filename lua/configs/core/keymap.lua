local keymap = vim.keymap

-- disable keys
keymap.set("n", "Q", "<Nop>")
keymap.set("n", "<Left>", "<Nop>")
keymap.set("n", "<Right>", "<Nop>")
keymap.set("n", "<Up>", "<Nop>")
keymap.set("n", "<Down>", "<Nop>")
keymap.set("n", "<C-z>", "<Nop>")

-- resize window
keymap.set("n", "<C-Left>", "<CMD>vertical resize +5<CR>")
keymap.set("n", "<C-Up>", "<CMD>resize -5<CR>")
keymap.set("n", "<C-Right>", "<CMD>vertical resize -5<CR>")
keymap.set("n", "<C-Down>", "<CMD>resize +5<CR>")

-- split window
keymap.set("n", "<C-A-k>", "<C-w>t<C-w>K")
keymap.set("n", "<C-A-h>", "<C-w>t<C-w>H")

-- terminal mode
keymap.set("t", "<Esc>", "<C-\\><C-n>")

-- nvim tree.lua
keymap.set("n", "`", "<CMD>NvimTreeToggle<CR>")

-- base64
keymap.set("v","<Leader>d6", "c<C-r>=system('base64 -d', @\")<CR><ESC>")
keymap.set("v","<Leader>e6", "c<C-r>=system('base64', @\")<CR><ESC>")

-- emmet-vim
keymap.set("i","<A-Tab>", "<C-y>,")
keymap.set("v","<A-Tab>", "<C-y>,")

-- Delete in search result
keymap.set("n", "<Leader>x", "<CMD>%s///<CR>")

-- Search for visually selected text
keymap.set("v","<Leader>v", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>")
