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
    lsp.Diagnostics,
    lsp.LSPActive,
    buffer.LineNumber,
}

local WinBar = {
    buffer.FileIcon,
    buffer.FilePath,
    others.Separator,
    others.Navic,
}

return setmetatable({}, {
    __call = function()
        require("heirline").setup({
            statusline = StatusLine,
            winbar = WinBar,
        })
    end,
})
