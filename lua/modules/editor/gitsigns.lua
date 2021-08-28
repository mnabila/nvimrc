local M = {}

function M.config()
    local options = {
        signs = {
            add = { hl = "GitSignAdd", text = "▍" },
            change = { hl = "GitSignChange", text = "▍" },
            delete = { hl = "GitSignDelete", text = "▍" },
            topdelete = { hl = "GitSignDelete", text = "▍" },
            changedelete = { hl = "GitSignChange", text = "▍" },
        },
    }

    require("gitsigns").setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
