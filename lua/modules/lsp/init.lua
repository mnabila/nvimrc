local M = {}

function M.config()
    require("modules.lsp.langserver")
    require("modules.lsp.diagnostic")
end

return M
