local M = {}

function M.config()
    require("indent_blankline").setup({
        char = "│",
        use_treesitter = true,
        show_current_context = false,
        max_indent_increase = 1,
        show_trailing_blankline_indent = false,
        filetype_exclude = {
            "Preview",
            "__doc__",
            "help",
            "log",
            "man",
            "markdown",
            "neo-tree",
            "neo-tree-popup",
            "peekaboo",
            "terminal",
            "translator",
            "aerial",
            "lspinfo",
            "lspsagafinder",
            "Trouble",
            "qf",
            "",
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
            "parameters",
            "expression_list",
            "for_statement",

            -- json
            "array",
            "object",
        },
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
