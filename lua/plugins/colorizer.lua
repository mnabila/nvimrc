local M = {}
local utils = require("utils.packer")

function M.config()
    local plugin = "colorizer"
    local ft = { "*" }
    local options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
    }
    -- vim.cmd("packadd nvim-colorizer.lua")
    -- require(plugin).setup(ft, options)
    utils.load(plugin, ft, options)
end

return M
