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

return M
