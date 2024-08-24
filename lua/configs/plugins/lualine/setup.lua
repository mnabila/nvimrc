require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "gruvbox",
    component_separators = { left = "", right = "" },
    section_separators = { left = " ", right = " " },
    disabled_filetypes = {
      statusline = {},
      winbar = {
        "sfm",
      },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = {},
    lualine_x = { "diagnostics" },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { "filename", path = 1 }, { "navic" } },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "trouble", "man", "fugitive" },
})
