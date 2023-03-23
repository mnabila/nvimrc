local lsp = require("configs.ui.heirline.lsp")
local buffer = require("configs.ui.heirline.buffer")
local git = require("configs.ui.heirline.git")
local others = require("configs.ui.heirline.others")
local utils = require("heirline.utils")

local StatusLine = {
    -- left section
    others.ViMode,
    git.Branch,
    others.Navic,
    -- center section
    others.Separator,
    -- right section
    lsp.Diagnostics,
    lsp.LSPActive,
    buffer.LineNumber,
}

local TabLine = {
    others.TabLineOffset,
    utils.make_buflist(buffer.BufBlock),
}


return setmetatable({}, {
    __call = function()
        require("heirline").setup({
            statusline = StatusLine,
            tabline = TabLine,
        })
    end,
})
