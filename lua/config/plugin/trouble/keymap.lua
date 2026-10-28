vim.keymap.set("n", "<Leader>t", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble: Open diagnostics" })
vim.keymap.set("n", "<Leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Trouble: Buffer diagnostics" })
vim.keymap.set("n", "<Leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Trouble: Symbols" })
vim.keymap.set("n", "<Leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
  { desc = "Trouble: LSP references/definitions" })
vim.keymap.set("n", "<Leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble: Location list" })
vim.keymap.set("n", "<Leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Trouble: Quickfix list" })
