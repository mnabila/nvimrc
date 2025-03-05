local util = require("config.statusline.util")
local M = {}

function M.vi_mode()
  local modes = {
    ["n"] = "NORMAL",
    ["no"] = "OP",
    ["nov"] = "OP",
    ["noV"] = "OP",
    ["no"] = "OP",
    ["niI"] = "NORMAL",
    ["niR"] = "NORMAL",
    ["niV"] = "NORMAL",
    ["v"] = "VISUAL",
    ["vs"] = "VISUAL",
    ["V"] = "LINES",
    ["Vs"] = "LINES",
    [""] = "BLOCK",
    ["s"] = "BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT",
    [""] = "BLOCK",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["ix"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rc"] = "REPLACE",
    ["Rv"] = "V-REPLACE",
    ["Rx"] = "REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "COMMAND",
    ["ce"] = "COMMAND",
    ["r"] = "ENTER",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERM",
    ["nt"] = "TERM",
    ["null"] = "NONE",
  }

  return "%#StatuslineBold#" .. " " .. modes[vim.api.nvim_get_mode().mode] .. "%#Statusline#" .. " "
end

function M.git_branch()
  return util.hide_in_width(50, function()
    local head = vim.b.gitsigns_head
    if head then
      return string.upper(vim.b.gitsigns_head) .. " "
    end
    return ""
  end)
end

function M.file_encoding()
  return util.hide_in_width(50, function()
    return ((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc):upper() .. " "
  end)
end

function M.file_format()
  return util.hide_in_width(50, function()
    return ((vim.bo.fileformat ~= "" and vim.bo.fileformat) or vim.o.fileformat):upper() .. " "
  end)
end

function M.file_name()
  local bufnr = vim.api.nvim_get_current_buf()
  local file = vim.api.nvim_buf_get_name(bufnr)

  if vim.bo.buftype ~= "" or file == "" then
    return ""
  end

  if util.is_width_under(50) then
    file = vim.fn.fnamemodify(file, ":t")
  else
    file = vim.fn.fnamemodify(file, ":.")
  end

  if vim.bo.filetype == "" then
    return file
  end

  local readonly = vim.bo.readonly and "[RO]" or ""
  local modified = vim.bo.modified and "[+]" or ""

  return string.format("%s %s%s", file, readonly, modified)
end

function M.file_type()
  if vim.bo.filetype ~= "" then
    return vim.bo.filetype:upper() .. " "
  end
  return ""
end

function M.line_number()
  if util.is_width_under(30) or vim.bo.buftype ~= "" then
    return ""
  end

  return string.format("Ln %-2d Col %-2d ", vim.fn.line("."), vim.fn.col("."))
end

function M.diagnostic_errors()
  return util.hide_in_width(50, function()
    local count = util.get_diagnostics(vim.diagnostic.severity.ERROR)
    return count ~= 0 and string.format("[E%d]", count) or ""
  end)
end

function M.diagnostic_warnings()
  return util.hide_in_width(50, function()
    local count = util.get_diagnostics(vim.diagnostic.severity.WARN)
    return count ~= 0 and string.format("[W%d]", count) or ""
  end)
end

function M.diagnostic_info()
  return util.hide_in_width(50, function()
    local count = util.get_diagnostics(vim.diagnostic.severity.INFO)
    return count ~= 0 and string.format("[I%d]", count) or ""
  end)
end

function M.diagnostic_hints()
  return util.hide_in_width(50, function()
    local count = util.get_diagnostics(vim.diagnostic.severity.HINT)
    return count ~= 0 and string.format("H%d ", count) or ""
  end)
end

return M
