vim.api.nvim_create_autocmd("BufWinEnter", {
  buffer = 0,
  callback = function()
    vim.cmd("wincmd L")
  end,
})
