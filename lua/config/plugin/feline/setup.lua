local feline = require("feline")
local c = require("config.plugin.feline.component")
local palette = require("gruvbox").palette

local theme = {
  fg = palette.dark0,
  bg = palette.light1,
  red = palette.bright_red,
  green = palette.bright_green,
  yellow = palette.bright_yellow,
  aqua = palette.bright_aqua,
}

local components = {
  active = {
    {
      c.vim_mode,
      c.git_branch,
      c.git_diff_added,
      c.git_diff_removed,
      c.git_diff_changed,
      c.file_info,
    },
    {
      c.diagnostic_errors,
      c.diagnostic_warnings,
      c.diagnostic_info,
      c.diagnostic_hints,
      c.search_count,
      c.position,
    },
  },
  inactive = {
    {
      c.git_branch,
      c.git_diff_added,
      c.git_diff_removed,
      c.git_diff_changed,
      c.file_info,
    },
  },
}

local conditional_components = {
  {
    condition = function()
      return vim.api.nvim_win_get_width(0) < 80
    end,
    active = {
      {
        c.vim_mode,
        c.file_info,
      },
      {
        c.diagnostic_errors,
        c.diagnostic_warnings,
        c.diagnostic_info,
        c.diagnostic_hints,
        c.position,
      },
    },
    inactive = {
      {
        c.git_branch,
        c.file_info,
      },
    },
  },
}

feline.setup({
  theme = theme,
  components = components,
  conditional_components = conditional_components,
})
