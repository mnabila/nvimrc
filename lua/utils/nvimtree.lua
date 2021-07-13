local tree = require("nvim-tree")
local view = require("nvim-tree.view")
local lib = require("nvim-tree.lib")
local bfstate = require("bufferline.state")

local M = {}

function M.toggle()
    if view.win_open() then
        bfstate.set_offset(0)
        view.close()
    else
        bfstate.set_offset(vim.g.nvim_tree_width)
        if vim.g.nvim_tree_follow == 1 then
            tree.find_file(true)
        end
        if not view.win_open() then
            lib.open()
        end
    end
end

return M
