local tree = require("nvim-tree")
local view = require("nvim-tree.view")
local bfstate = require("bufferline.state")

local M = {}

function M.toggle()
    if view.win_open() then
        bfstate.set_offset(0)
        view.close()
    else
        bfstate.set_offset(35)
        tree.find_file(true)
        tree.open()
    end
end

return M
