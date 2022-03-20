local mappings = require("cokeline.mappings")
local colors = require("gruvboy.colors")

local C = {}

C.nvimtree = {
    text = "File Browser",
    hl = {
        fg = colors.yelow,
        bg = colors.bg0,
        style = "bold",
    },
}

C.space = {
    text = " ",
    truncation = { priority = 1 },
}

C.devicon = {
    text = function(buffer)
        return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
            or buffer.devicon.icon
    end,
    hl = {
        fg = function(buffer)
            return (mappings.is_picking_focus() and colors.yellow)
                or (mappings.is_picking_close() and colors.red)
                or buffer.devicon.color
        end,
    },
    truncation = { priority = 1 },
}

C.filename = {
    text = function(buffer)
        local name = buffer.unique_prefix .. buffer.filename
        if name == "[No Name]" then
            name = "empty"
        end
        return name
    end,
    hl = {
        fg = function(buffer)
            return (buffer.diagnostics.errors ~= 0 and colors.bright_red)
                or (buffer.diagnostics.warnings ~= 0 and colors.bright_orange)
                or (buffer.diagnostics.infos ~= 0 and colors.bright_yellow)
                or (buffer.diagnostics.hints ~= 0 and colors.bright_blue)
                or nil
        end,
        style = function(buffer)
            return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold")
                or (buffer.is_focused and "bold")
                or (buffer.diagnostics.errors ~= 0 and "underline")
                or nil
        end,
    },
    truncation = {
        priority = 2,
        direction = "left",
    },
}

C.close_or_unsaved = {
    text = function(buffer)
        return buffer.is_modified and "●" or ""
    end,
    hl = {
        fg = function(buffer)
            return (buffer.is_modified and colors.green) or nil
        end,
    },
    delete_buffer_on_left_click = true,
    truncation = { priority = 1 },
}

local M = {}
function M.config()
    require("cokeline").setup({
        show_if_buffers_are_at_least = 1,

        buffers = {
            filter_valid = false,
            filter_visible = false,
            focus_on_delete = "prev",
            new_buffers_position = "next",
        },

        mappings = {
            cycle_prev_next = true,
        },

        sidebar = {
            filetype = "NvimTree",
            components = {
                C.nvimtree,
            },
        },
        default_hl = {
            fg = function(buffer)
                if buffer.is_focused then
                    return colors.fg1
                end
                return colors.bg4
            end,
            bg = colors.bg0,
            style = function(buffer)
                if buffer.is_focused then
                    return "bold"
                end
                return "NONE"
            end,
        },

        components = {
            C.space,
            C.devicon,
            C.space,
            C.filename,
            C.space,
            C.close_or_unsaved,
            C.space,
        },
    })

    local map = require("utils.keymap").map

    map("<A-h>", "<Plug>(cokeline-focus-prev)")
    map("<A-l>", "<Plug>(cokeline-focus-next)")
    map("<A-H>", "<Plug>(cokeline-switch-prev)")
    map("<A-L>", "<Plug>(cokeline-switch-next)")
    map("<Leader>q", "<CMD>bd<CR>")
    map("<Leader>qq", "<CMD>bufdo bd<CR>")
    map("<Leader>qa", "<CMD>bufdo bd!<CR>")

    for i = 1, 9 do
        map(("<A-%s>"):format(i), ("<Plug>(cokeline-focus-%s)"):format(i))
    end
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
