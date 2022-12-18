local M = {}

function M.config()
    local options = {
        ensure_installed = {
            "go",
            "gomod",
            "help",
            "json",
            "lua",
            "markdown",
            "sql",
            "tsx",
            "typescript",
            "vim",
            "yaml",
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
        playground = {
            enable = true,
            updatetime = 25,
            persist_queries = false,
        },
    }

    require("nvim-treesitter.configs").setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
