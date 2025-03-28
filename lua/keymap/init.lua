local map = vim.keymap

-- disable keys
map.set("n", "<Left>", "<Nop>")
map.set("n", "<Right>", "<Nop>")
map.set("n", "<Up>", "<Nop>")
map.set("n", "<Down>", "<Nop>")
map.set("n", "<C-z>", "<Nop>")

-- resize window
map.set("n", "<C-Left>", "<CMD>vertical resize +5<CR>")
map.set("n", "<C-Up>", "<CMD>resize -5<CR>")
map.set("n", "<C-Right>", "<CMD>vertical resize -5<CR>")
map.set("n", "<C-Down>", "<CMD>resize +5<CR>")

-- split window
map.set("n", "<C-A-k>", "<C-w>t<C-w>K")
map.set("n", "<C-A-h>", "<C-w>t<C-w>H")

-- terminal mode
map.set("t", "<Esc>", "<C-\\><C-n>")

-- base64
map.set("v", "<Leader>d6", "c<C-r>=system('base64 -d', @\")<CR><ESC>", { desc = "Decode base64 string" })
map.set("v", "<Leader>e6", "c<C-r>=system('base64', @\")<CR><ESC>", { desc = "Encode to base64 string" })

-- others
map.set("n", "<Leader>x", "<CMD>%s///<CR>", { desc = "Delete in search result" })

-- buffer
map.set("n", "<C-k>", "<CMD>bprevious<CR>", { desc = "Buffer: focus to previous buffer" })
map.set("n", "<C-j>", "<CMD>bnext<CR>", { desc = "Buffer: focus to next buffer" })
map.set("n", "<Leader>q", "<CMD>bd<CR>", { desc = "Buffer: delete buffer" })
map.set("n", "<Leader>qq", "<CMD>%bd<CR>", { silent = true, desc = "Buffer: delete all buffer" })
map.set("n", "<Leader>qa", "<CMD>%bd!<CR>", { silent = true, desc = "Buffer: force delete all buffer" })
map.set("n", "<Leader>qo", "<CMD>%bd|e#<CR>", { silent = true, desc = "Buffer: delete all buffer except this one" })
