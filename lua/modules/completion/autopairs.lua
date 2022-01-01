local M = {}

function M.config()
    local options = {
        disable_filetype = { "TelescopePrompt" },
        check_ts = true,
        map_bs = true,
    }

    require("nvim-autopairs").setup(options)
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
