local c = require("config.statusbar.component")

function Winbar()
  return table.concat({
    c.file_name(),
    c.breadcrumb(),
    "%=",
    c.lsp_name(),
  })
end

local function hide_winbar(buf)
  local ignore_filetypes = { "sfm", "help", "terminal", "lazy", "mason", "TelescopePrompt" }
  return not buf or vim.api.nvim_buf_get_name(buf) == "" or vim.tbl_contains(ignore_filetypes, vim.bo[buf].filetype)
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufLeave" }, {
  group = vim.api.nvim_create_augroup("Winbar", { clear = true }),
  pattern = "*",
  callback = function(args)
    if hide_winbar(args.buf) then
      return
    end

    vim.opt_local.winbar = "%{%v:lua.Winbar()%}"
  end,
})
