local keymap = vim.keymap
local neogit = require("neogit")

neogit.setup({
  signs = {
    hunk = { "", "" },
    item = { "", "" },
    section = { "", "" },
  },
})

keymap.set("n", "<Leader>g", neogit.open, { desc = "Git: Open Neogit" })
