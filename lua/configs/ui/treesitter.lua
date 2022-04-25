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
    vim.api.nvim_create_user_command("TSPrintNode", function()
        print(require("nvim-treesitter.ts_utils").get_node_at_cursor():type())
    end, { nargs = 0 })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})