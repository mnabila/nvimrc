local M = {}
local utils = require("utils.packer")

function M.config()
    local plugin = "nvim-treesitter.configs"
    local options = {
        ensure_installed = {
            "bash",
            "lua",
            "python",
            "html",
            "javascript",
            "css",
            "json",
        },
        highlight = {
            enable = true,
            use_languagetree = true,
        },
        indent = {
            enable = true,
            disable = { "python" },
        },
        -- p00f/nvim-ts-rainbow
        rainbow = {
            enable = true,
        },
        -- windwp/nvim-autopairs
        autopairs = {
            enable = true,
        },
        -- windwp/nvim-ts-autotag
        autotag = {
            enable = true,
            filetypes = { "html", "xml" },
        },
    }
    utils.load(plugin, options)
end

return M
