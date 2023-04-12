local conditions = require("heirline.conditions")
local M = {}

M.LSPActive = {
    condition = function()
        return conditions.lsp_attached() and vim.api.nvim_win_get_width(0) > 80
    end,
    update = { "LspAttach", "LspDetach" },
    provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
            table.insert(names, server.name)
        end
        return string.format(" 󰌘  %s", table.concat(names, " "))
    end,
    hl = { fg = "black", bg = "white", bold = true },
}

M.Diagnostics = {
    condition = function()
        return conditions.has_diagnostics() and vim.api.nvim_win_get_width(0) > 80
    end,
    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,
    update = { "DiagnosticChanged", "BufEnter" },
    {
        provider = function(self)
            local icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text
            return self.errors > 0 and string.format(" %s %s ", icon, self.errors)
        end,
    },
    {
        provider = function(self)
            local icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text
            return self.errors > 0 and string.format(" %s %s ", icon, self.warnings)
        end,
    },
    {
        provider = function(self)
            local icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text
            return self.errors > 0 and string.format(" %s %s ", icon, self.info)
        end,
    },
}

return M
