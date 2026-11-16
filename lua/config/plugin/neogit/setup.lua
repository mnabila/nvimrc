local neogit = require("neogit")

neogit.setup({
  signs = {
    hunk = { "", "" },
    item = { "", "" },
    section = { "", "" },
  },
})

-- Neogit forces nowrap on its windows; re-enable wrap on the status diff view.
vim.api.nvim_create_autocmd("User", {
  pattern = "NeogitStatusRefreshed",
  callback = function()
    if vim.bo.filetype == "NeogitStatus" then
      vim.wo.wrap = true
    end
  end,
})
