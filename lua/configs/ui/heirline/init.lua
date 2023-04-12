local lsp = require("configs.ui.heirline.lsp")
local buffer = require("configs.ui.heirline.buffer")
local git = require("configs.ui.heirline.git")
local others = require("configs.ui.heirline.others")

local StatusLine = {
    -- left section
    others.ViMode,
    git.Branch,

    -- center section
    others.Separator,

    -- right section
    -- lsp.Diagnostics,
    lsp.LSPActive,
    buffer.FileType,
    buffer.LineNumber,
}

-- local TabLine = {
--     others.TabLineOffset,
--     buffer.FilePath,
-- }

local WinBar = {
    buffer.FilePath,
    lsp.Diagnostics,
    others.Separator,
    others.Separator,
    others.Navic,
}

require("heirline").setup({
    statusline = StatusLine,
    -- tabline = TabLine,
    winbar = WinBar,
    opts = {
        colors = {
            black = "#282828",
            white = "#ebdbb2",
            gray = "#a89984",
            red = "#fb4934",
            yellow = "#fabd2f",
            blue = "#83a598",
        },
    },
})
