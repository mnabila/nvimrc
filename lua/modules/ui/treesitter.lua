local M = {}

function M.config()
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

    require("nvim-treesitter.configs").setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
