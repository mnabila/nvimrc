local c = require("config.statusline.component")

function MyStatusline()
  return table.concat({
    c.vi_mode(),
    c.git_branch(),
    c.file_name(),
    "%=",
    c.line_number(),
    c.file_encoding(),
    c.file_format(),
  })
end

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  group = vim.api.nvim_create_augroup("Statusline", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.statusline = "%!v:lua.MyStatusline()"
  end,
})
