local lsp = require("configs.ui.heirline.lsp")
local buffer = require("configs.ui.heirline.buffer")
local git = require("configs.ui.heirline.git")
local others = require("configs.ui.heirline.others")

return setmetatable({}, {
    __call = function()
        local StatusLine = {
            -- left section
            others.ViMode,
            git.Branch,
            -- center section
            others.Align,
            lsp.Diagnostics,
            others.Align,
            -- right section
            lsp.LSPActive,
            buffer.FileType,
            buffer.LineNumber,
        }
        require("heirline").setup({
            statusline = StatusLine,
        })
    end,
})
