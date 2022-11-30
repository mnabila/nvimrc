local keymap = vim.keymap

-- disable keys
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

-- base64
keymap.set("v", "<Leader>d6", "c<C-r>=system('base64 -d', @\")<CR><ESC>", { desc = "Decode base64 string" })
keymap.set("v", "<Leader>e6", "c<C-r>=system('base64', @\")<CR><ESC>", { desc = "Encode to base64 string" })

keymap.set("n", "<Leader>x", "<CMD>%s///<CR>", { desc = "Delete in search result" })

keymap.set("v", "<Leader>v", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", { desc = "Search for visually selected text" })

--- jump betweenn split
-- keymap.set("n", "<A-h>", "<C-w>h", { desc = "Split: jump to left" })
-- keymap.set("n", "<A-j>", "<C-w>j", { desc = "Split: jump to down" })
-- keymap.set("n", "<A-k>", "<C-w>k", { desc = "Split: jump to up" })
-- keymap.set("n", "<A-l>", "<C-w>l", { desc = "Split: jump to right" })
-- keymap.set("n", "<A-w>", "<C-w>w", { desc = "Split: jump to last accessed" })
