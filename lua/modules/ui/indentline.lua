local M = {}

function M.config()
    require("indent_blankline").setup({
        char = "│",
        use_treesitter = true,
        show_current_context = true,
        filetype_exclude = {
            "NvimTree",
            "Preview",
            "__doc__",
            "dashboard",
            "dashpreview",
            "fzf",
            "help",
            "log",
            "man",
            "markdown",
            "nerdtree",
            "peekaboo",
            "sagahover",
            "startify",
            "terminal",
            "translator",
            "vista",
            "packer",
            "aerial",
            "lspinfo",
            "lspsagafinder",
            "Trouble",
        },
        buftype_exclude = { "terminal", "man", "trouble" },
        context_patterns = {
            "class",
            "function",
            "method",
            "if",
            "table",
            "dictionary",
            "list",
            "parameters"

        },
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
