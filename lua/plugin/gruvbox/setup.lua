local p = require("gruvbox").palette

require("gruvbox").setup({
  inverse = false,
  dim_inactive = false,
  transparent_mode = false,
  overrides = {
    GruvboxRedSign = { link = "GruvboxRed" },
    GruvboxGreenSign = { link = "GruvboxGreen" },
    GruvboxYellowSign = { link = "GruvboxYellow" },
    GruvboxBlueSign = { link = "GruvboxBlue" },
    GruvboxPurpleSign = { link = "GruvboxPurple" },
    GruvboxAquaSign = { link = "GruvboxAqua" },
    GruvboxOrangeSign = { link = "GruvboxOrange" },

    TabLineFill = { link = "Normal" },
    SignColumn = { link = "Normal" },
    NormalFloat = { link = "Normal" },
    Search = { fg = p.dark0, bg = p.bright_yellow },
    IncSearch = { fg = p.dark0, bg = p.bright_orange },
    WinSeparator = { fg = p.light0 },
    SFMFolderIndicator = { fg = p.light4 },
    StatuslineBold = { bold = true },
    TroubleFoldIcon = { link = "Normal" },
    TroubleCount = { link = "GruvboxOrange", reverse = true },
    LspInfoBorder = { link = "Normal" },
  },
})

vim.cmd("colorscheme gruvbox")
