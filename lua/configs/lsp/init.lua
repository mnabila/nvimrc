local M = {}

function M.config()
    require("configs.lsp.langserver")
    require("configs.lsp.diagnostic")
    require("configs.lsp.nulls")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
