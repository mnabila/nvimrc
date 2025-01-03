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

-- others
keymap.set("n", "<Leader>x", "<CMD>%s///<CR>", { desc = "Delete in search result" })

-- buffer
keymap.set("n", "<C-k>", "<CMD>bprevious<CR>", { desc = "Buffer: focus to previous buffer" })
keymap.set("n", "<C-j>", "<CMD>bnext<CR>", { desc = "Buffer: focus to next buffer" })
keymap.set("n", "<Leader>q", "<CMD>bd<CR>", { desc = "Buffer: delete buffer" })
keymap.set("n", "<Leader>qq", "<CMD>%bd<CR>", { silent = true, desc = "Buffer: delete all buffer" })
keymap.set("n", "<Leader>qa", "<CMD>%bd!<CR>", { silent = true, desc = "Buffer: force delete all buffer" })
keymap.set("n", "<Leader>qo", "<CMD>%bd|e#<CR>", { silent = true, desc = "Buffer: delete all buffer except this one" })
