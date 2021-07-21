local M = {}
local utils = require("utils.packer")

function M.config()
    local plugin = "nvim-autopairs"
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
    utils.load(plugin, options)
end

return M
