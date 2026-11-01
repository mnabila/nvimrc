local M = {}

function M.set_indent(width)
  vim.opt_local.shiftwidth = width
  vim.opt_local.softtabstop = width
end

return M