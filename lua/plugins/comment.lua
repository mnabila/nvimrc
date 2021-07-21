local M = {}
local utils = require("utils.packer")

function M.config()
    local plugin = "nvim_comment"
    local options = {
        -- Linters prefer comment and line to hae a space in between
        left_marker_padding = true,
        -- should comment out empty or whitespace only lines
        comment_empty = false,
        -- Should key mappings be created
        create_mappings = true,
        -- Normal mode mapping left hand side
        line_mapping = "gcc",
        -- Visual/Operator mapping left hand side
        operator_mapping = "gc",
    }
    utils.load(plugin, options)
end

return M
