require("lspsaga").setup({
  lightbulb = {
    virtual_text = false,
  },
  outline = {
    left_width = 0.5,
    layout = "normal",
  },
  symbol_in_winbar = {
    enable = true,
    folder_level = 0,
    color_mode = true,
    separator = " ❱ ",
  },
  hover = {
    open_cmd = "!xdg-open",
  },
})
