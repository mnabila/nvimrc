local M = {}
local utils = require("utils.packer")

function M.config()
    local plugin = "nvim-biscuits"
    local options = {
        default_config = {
            min_distance = 5,
            max_length = 80,
            prefix_string = "  ",
        },
    }
    utils.load(plugin, options)
end

return M
