local M = {}

function M.config()
    vim.g.bufferline = {
        animation = false,
        auto_hide = false,
        icons = true,
        icon_separator_active = "",
        icon_separator_inactive = "",
        icon_close_tab = "",
        icon_close_tab_modified = " ",
        closable = true,
        clickable = true,
        semantic_letters = true,
        maximum_padding = 2,
        no_name_title = " empty",
    }
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
