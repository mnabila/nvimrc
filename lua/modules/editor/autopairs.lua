local M = {}

function M.config()
    local options = {
        pairs_map = {
            ["'"] = "'",
            ['"'] = '"',
            ["("] = ")",
            ["["] = "]",
            ["{"] = "}",
            ["`"] = "`",
        },
        disable_filetype = { "TelescopePrompt" },
        break_line_filetype = nil,
        check_line_pair = true,
        html_break_line_filetype = { "html", "vue", "typescriptreact", "svelte", "javascriptreact" },
        ignored_next_char = "%w",
        check_ts = true,
    }

    require("nvim-autopairs").setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
