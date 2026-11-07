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
map.set("n", "<esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
map.set("n", "<Leader>x", "<cmd>%s///<cr>", { desc = "Delete in search result" })
