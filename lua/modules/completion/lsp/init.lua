local M = {}

function M.config()
    require("modules.completion.lsp.langserver")
    require("modules.completion.lsp.diagnostic")
    require("modules.completion.lsp.aerial")
    require("modules.completion.lsp.trouble")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
