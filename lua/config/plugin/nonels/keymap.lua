local keymap = vim.keymap

local format = function()
  vim.lsp.buf.format({ async = true })
end

keymap.set("n", "<leader>f", format, { desc = "LSP: Formats the current buffer" })
