local M = {}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = "maintained",
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
    })
end

return M
