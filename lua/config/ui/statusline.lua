local c = require("config.ui.component")

-- global so the 'statusline' %{%...%} expression below can call it
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

vim.opt.statusline = "%{%v:lua.Statusline()%}"

-- measure buffer load time: stamp start on BufReadPre, compute elapsed ms on
-- BufReadPost. Result cached in b:loaded, rendered by c.load_time().
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

-- cache file size per buffer so c.file_size() reads a var instead of calling
-- fs_stat on every statusline redraw. Refreshed on enter and after writes.
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = group,
  callback = function(args)
    local buf = args.buf
    local name = vim.api.nvim_buf_get_name(buf)
    if name == "" then
      return
    end

    local stat = vim.uv.fs_stat(name)
    if not stat then
      vim.b[buf].file_size_str = ""
      return
    end

    local size = stat.size
    if size >= 1024 * 1024 then
      vim.b[buf].file_size_str = string.format("%.2f MB ", size / (1024 * 1024))
    elseif size >= 1024 then
      vim.b[buf].file_size_str = string.format("%.2f KB ", size / 1024)
    else
      vim.b[buf].file_size_str = string.format("%d B ", size)
    end
  end,
})
