local M = {}

local function diagnostic(severity, icon, fg)
    return {
        provider = function()
            local count = vim.tbl_count(vim.diagnostic.get(0, severity and { severity = severity }))
            return string.format("%s%d ", icon, count)
        end,

        enabled = function()
            return next(vim.lsp.buf_get_clients(0)) ~= nil
                and vim.tbl_count(vim.diagnostic.get(0, severity and { severity = severity })) > 0
                and vim.api.nvim_win_get_width(0) > 100
        end,

        hl = { bg = "black", fg = fg },
    }
end

M.name = {
    provider = function()
        local clients = {}

        for _, client in pairs(vim.lsp.buf_get_clients(0)) do
            clients[#clients + 1] = client.name
        end

        if vim.api.nvim_win_get_width(0) > 100 then
            return string.format("   %s ", table.concat(clients, ", "))
        end
        return "   "
    end,
    enabled = function()
        return next(vim.lsp.buf_get_clients(0)) ~= nil
    end,
    hl = {
        fg = "white",
        bg = "black",
    },
}

M.diagnostic = {
    errors = diagnostic(1, " ", "red"),
    warn = diagnostic(2, " ", "yellow"),
    info = diagnostic(3, " ", "blue"),
    hint = diagnostic(4, " ", "green"),
}
return M
