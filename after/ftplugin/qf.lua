vim.keymap.set("v", "<c-v>", function()
  local items = vim.fn.getqflist()
  if #items == 0 then
    vim.notify("qf item kosong", vim.log.levels.INFO)
    return
  end

  if not (vim.bo.filetype == "qf") then
    vim.notify("not qf window", vim.log.levels.INFO)
    return
  end

  -- local from, to = vim.fn.line ".", vim.fn.line "v"
  local from, to = vim.fn.line("."), vim.fn.line("v")
  if from > to then
    from, to = to, from
  end

  for i = from, to do
    local item = items[i]
    if item then
      vim.cmd([[wincmd p]])

      local filename = vim.api.nvim_buf_get_name(item.bufnr)

      vim.cmd("vsp " .. filename)
    end
  end

  vim.cmd([[wincmd =]])
end, { buffer = vim.api.nvim_get_current_buf() })
