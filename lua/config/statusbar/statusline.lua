local c = require("config.statusbar.component")

function Statusline()
  return table.concat({
    c.vi_mode(),
    c.git_branch(),
    "%=",
    c.diagnostic_errors(),
    c.diagnostic_warnings(),
    c.diagnostic_info(),
    c.diagnostic_hints(),
    c.line_number(),
    c.file_type(),
    c.file_size(),
    c.load_time(),
    c.file_encoding(),
    c.file_format(),
  })
end

local group = vim.api.nvim_create_augroup("StatusLine", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave" }, {
  group = group,
  pattern = "*",
  callback = function()
    vim.opt_local.statusline = "%{%v:lua.Statusline()%}"
  end,
})

vim.api.nvim_create_autocmd("BufReadPre", {
  group = group,
  callback = function(args)
    vim.b[args.buf].loading = vim.uv.hrtime()
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  group = group,
  callback = function(args)
    if not vim.b[args.buf].loading then
      return
    end

    vim.b[args.buf].loaded = (vim.uv.hrtime() - vim.b[args.buf].loading) / 1e6
  end,
})
