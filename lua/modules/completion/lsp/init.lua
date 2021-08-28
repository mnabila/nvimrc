local M = {}

function M.config()
    require("modules.completion.lsp.langserver")
    require("modules.completion.lsp.diagnostic")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
