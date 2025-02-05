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

  return "%#StatuslineViMode#" .. " " .. modes[vim.api.nvim_get_mode().mode] .. "%#Statusline#" .. " "
end

function M.git_branch()
  local head = vim.b.gitsigns_head
  if head then
    return string.format("(%s) ", vim.b.gitsigns_head)
  end
  return ""
end

function M.file_encoding()
  return ((vim.bo.fenc ~= "" and vim.bo.fenc) or vim.o.enc):upper() .. " "
end

function M.file_format()
  return ((vim.bo.fileformat ~= "" and vim.bo.fileformat) or vim.o.fileformat):upper() .. " "
end

function M.file_name()
  if vim.bo.buftype == "" then
    if vim.bo.filetype == "" then
      return vim.fn.expand("%f")
    else
      return string.format(
        "%s %s%s",
        vim.fn.expand("%f"),
        vim.bo.readonly and "[RO]" or "",
        vim.bo.modified and "[+]" or ""
      )
    end
  end
  return ""
end

function M.file_type()
  if vim.bo.filetype ~= "" then
    return vim.bo.filetype:upper() .. " "
  end
  return ""
end

function M.line_number()
  return string.format("Ln %-2d Col %-2d ", vim.fn.line("."), vim.fn.col("."))
end

function M.show_cmd()
  return "%S "
end

return M
