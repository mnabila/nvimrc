require("markview").setup({
  preview = {
    filetypes = {
      "markdown",
      "codecompanion",
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "codecompanion",
  command = "Markview attach",
})
