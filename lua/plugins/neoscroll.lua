local M = {}
local utils = require("utils.packer")

function M.config()
    local plugin = "neoscroll"
    local options = {
        -- All these keys will be mapped. Pass an empty table ({}) for no mappings
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    }

    utils.load(plugin, options)
end

return M
