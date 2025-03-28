local M = {}

function M.git_diff(type, icon)
  local gsd = vim.b.gitsigns_status_dict

  if gsd and gsd[type] and gsd[type] > 0 then
    if icon ~= "" then
      return icon .. tostring(gsd[type])
    end
    return tostring(gsd[type])
  end

  return ""
end

function M.git_info_exists()
  return vim.b.gitsigns_head or vim.b.gitsigns_status_dict
end

function M.get_diagnostics(severity)
  return vim.tbl_count(vim.diagnostic.get(0, severity and { severity = severity }))
end

function M.is_width_under(width)
  local columns = vim.o.columns / 2
  return columns < width
end

function M.hide_in_width(width, component)
  if M.is_width_under(width) then
    return ""
  end
  return component()
end

return M
