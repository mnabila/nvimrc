local M = {}

function M.config()
    require("configs.completion.lsp.langserver")
    require("configs.completion.lsp.diagnostic")
    require("configs.completion.lsp.nulls")
    -- require("configs.completion.lsp.aerial")
    require("configs.completion.lsp.trouble")
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
