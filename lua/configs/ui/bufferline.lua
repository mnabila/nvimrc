local mappings = require("cokeline.mappings")
local hlprop = require("configs.core.utils").hlprop

local C = {}

C.file_manager = {
    text = "File Browser",
    fg = hlprop("Normal").fg,
    bg = hlprop("Normal").bg,
    style = "bold",
}

C.space = {
    text = " ",
    truncation = { priority = 1 },
    fg = hlprop("Normal").bg,
    bg = hlprop("Normal").bg,
}

C.devicon = {
    text = function(buffer)
        return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
            or buffer.devicon.icon
    end,
    fg = function(buffer)
        return buffer.is_focused and buffer.devicon.color
    end,
    bg = hlprop("Normal").bg,
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
    fg = function(buffer)
        return (buffer.is_focused and hlprop("Normal").fg)
            or (buffer.diagnostics.errors ~= 0 and hlprop("DiagnosticError").fg)
            or (buffer.diagnostics.warnings ~= 0 and hlprop("DiagnosticWarn").fg)
            or (buffer.diagnostics.infos ~= 0 and hlprop("DiagnosticInfo").fg)
            or (buffer.diagnostics.hints ~= 0 and hlprop("DiagnosticHint").fg)
            or nil
    end,
    bg = hlprop("Normal").bg,
    style = function(buffer)
        return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold")
            or (buffer.is_focused and "bold")
            or (buffer.diagnostics.errors ~= 0 and "underline")
            or nil
    end,
    truncation = {
        priority = 2,
        direction = "left",
    },
}

C.close_or_unsaved = {
    text = function(buffer)
        return buffer.is_modified and "●" or ""
    end,
    fg = function(buffer)
        return (buffer.is_modified and hlprop("Visual").fg) or nil
    end,
    bg = hlprop("Normal").bg,
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
            focus_on_delete = false,
            new_buffers_position = "next",
        },

        mappings = {
            cycle_prev_next = true,
        },

        sidebar = {
            filetype = "neo-tree",
            components = {
                C.file_manager,
            },
        },
        default_hl = {
            fg = function(buffer)
                return buffer.is_focused ~= true and hlprop("Comment").fg
            end,
            bg = hlprop("Comment").bg,
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

    vim.keymap.set("n", "<A-h>", "<Plug>(cokeline-focus-prev)", { desc = "Buffer: focus to previous buffer" })
    vim.keymap.set("n", "<A-l>", "<Plug>(cokeline-focus-next)", { desc = "Buffer: focus to next buffer" })
    vim.keymap.set("n", "<A-H>", "<Plug>(cokeline-switch-prev)", { desc = "Buffer: switch to previous buffer" })
    vim.keymap.set("n", "<A-L>", "<Plug>(cokeline-switch-next)", { desc = "Buffer: switch to next buffer" })
    vim.keymap.set("n", "<Leader>q", "<CMD>bd<CR>", { desc = "Buffer: delete buffer" })
    vim.keymap.set("n", "<Leader>qq", "<CMD>%bd<CR>", { silent = true, desc = "Buffer: delete all buffer" })
    vim.keymap.set("n", "<Leader>qa", "<CMD>%bd!<CR>", { silent = true, desc = "Buffer: force delete all buffer" })
    vim.keymap.set(
        "n",
        "<Leader>qo",
        "<CMD>%bd|e#<CR>",
        { silent = true, desc = "Buffer: delete all buffer except this one" }
    )

    for i = 1, 9 do
        vim.keymap.set(
            "n",
            ("<A-%s>"):format(i),
            ("<Plug>(cokeline-focus-%s)"):format(i),
            { desc = ("Buffer: focus to buffer %s"):format(i) }
        )
    end
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
