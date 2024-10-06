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
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "diagnostics" },
    lualine_y = { "filetype" },
    lualine_z = { "location" },
  },
  extensions = { "trouble", "man", "fugitive" },
})
