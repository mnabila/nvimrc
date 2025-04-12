local map = vim.keymap

-- disable keys
map.set("n", "<Left>", "<Nop>")
map.set("n", "<Right>", "<Nop>")
map.set("n", "<Up>", "<Nop>")
map.set("n", "<Down>", "<Nop>")
map.set("n", "<C-z>", "<Nop>")

-- resize window
map.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map.set("n", "<C-Up>", "<cmd>resize +2<cr>")
map.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")
map.set("n", "<C-Down>", "<cmd>resize -2<cr>")

-- base64
map.set("v", "<Leader>d6", "c<C-r>=system('base64 -d', @\")<cr><esc>", { desc = "Decode base64 string" })
map.set("v", "<Leader>e6", "c<C-r>=system('base64', @\")<cr><esc>", { desc = "Encode to base64 string" })

-- others
map.set("n", "<Leader>x", "<cmd>%s///<cr>", { desc = "Delete in search result" })

-- buffer
map.set("n", "<C-k>", "<cmd>bprevious<cr>", { desc = "Buffer: focus to previous buffer" })
map.set("n", "<C-j>", "<cmd>bnext<cr>", { desc = "Buffer: focus to next buffer" })
map.set("n", "<Leader>q", "<cmd>bd<cr>", { desc = "Buffer: delete buffer" })
map.set("n", "<Leader>qq", "<cmd>%bd<cr>", { silent = true, desc = "Buffer: delete all buffer" })
map.set("n", "<Leader>qa", "<cmd>%bd!<cr>", { silent = true, desc = "Buffer: force delete all buffer" })
map.set("n", "<Leader>qo", "<cmd>%bd|e#<cr>", { silent = true, desc = "Buffer: delete all buffer except this one" })
