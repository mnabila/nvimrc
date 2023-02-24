local M = {}

M.vimode = {
    provider = function()
        return string.format("  %s ", require("feline.providers.vi_mode").get_vim_mode())
    end,
    hl = {
        bg = "yellow",
        fg = "black",
        style = "bold",
    },
}

M.blank = {
    provider = "",
    hl = {
        bg = "black",
        fg = "white",
    },
}

return M
