local lsp = require("configs.ui.feline.components.lsp")
local buffer = require("configs.ui.feline.components.buffer")
local git = require("configs.ui.feline.components.git")
local others = require("configs.ui.feline.components.others")
local hlprop = require("configs.core.utils").hlprop

local M = {}
function M.config()
    local feline = require("feline")
    local active = {
        -- left
        {
            others.vimode,
            git.branch,
            git.diff_add,
            git.diff_changed,
            git.diff_remove,
            buffer.name,
            others.blank,
        },
        -- right
        {
            lsp.diagnostic.errors,
            lsp.diagnostic.warn,
            lsp.diagnostic.info,
            lsp.diagnostic.hint,
            lsp.name,
            buffer.type,
            buffer.format,
            buffer.encode,
            buffer.cursor_position,
        },
    }

    feline.setup({
        components = {
            active = active,
            inactive = active,
        },
        force_inactive = {
            filetypes = {
                "NvimTree",
            },
            buftypes = { "terminal" },
            bufnames = {},
        },
    })

    feline.use_theme({
        black = hlprop("Normal").bg,
        altblack = hlprop("Comment").fg,
        red = hlprop("DiagnosticError").fg,
        green = hlprop("String").fg,
        yellow = hlprop("DiagnosticWarn").fg,
        blue = hlprop("DiagnosticInfo").fg,
        white = hlprop("Normal").fg,
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
