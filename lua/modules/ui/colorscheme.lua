local M = {}

function M.config()
    local gu = require("gruvboy.utils")
    if gu.compile_is_exist() == false then
        gu.compile()
    end

    vim.cmd("colorscheme gruvboy_compiled")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
