local lsp = require("configs.ui.feline.components.lsp")
local buffer = require("configs.ui.feline.components.buffer")
local git = require("configs.ui.feline.components.git")
local hlprop = require("configs.core.utils").hlprop

local blank = {
    provider = "",
    hl = {
        bg = "bg",
        fg = "fg",
    },
}

local vimode = {
    provider = function()
        return string.format("  %s ", require("feline.providers.vi_mode").get_vim_mode())
    end,
    hl = {
        bg = "yellow",
        fg = "black",
        style = "bold",
    },
}

local M = {}
function M.config()
    local feline = require("feline")
    local active = {
        -- left
        {
            vimode,
            git.branch,
            git.diff_add,
            git.diff_changed,
            git.diff_remove,
            buffer.name,
            blank,
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
        bg = hlprop("Normal").bg,
        fg = hlprop("Normal").fg,
        yellow = hlprop("Type").fg,
        gray = hlprop("LineNr").fg,
        altgray = hlprop("Todo").fg,
        red = hlprop("Debug").bg,
        aqua = hlprop("Title").bg,
        blue = hlprop("Identifier").fg,
        black = hlprop("Comment").bg,
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
