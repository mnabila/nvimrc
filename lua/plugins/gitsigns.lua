local M = {}
local utils = require("utils.packer")

function M.config()
    local plugin = "gitsigns"
    local options = {
        signs = {
            add = { hl = "GitSignAdd", text = "▍" },
            change = { hl = "GitSignChange", text = "▍" },
            delete = { hl = "GitSignDelete", text = "▍" },
            topdelete = { hl = "GitSignDelete", text = "▍" },
            changedelete = { hl = "GitSignChange", text = "▍" },
        },
    }
    utils.load(plugin, options)
end

return M
