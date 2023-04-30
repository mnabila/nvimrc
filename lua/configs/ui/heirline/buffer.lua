local M = {}

M.FilePath = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
    condition = function()
        return vim.api.nvim_buf_get_name(0) ~= ""
    end,
    hl = function()
        if vim.bo.modified then
            return { link = "DiffAdd" }
        end
    end,
    {
        provider = function(self)
            local extension = vim.fn.fnamemodify(self.filename, ":e")
            local icon, _ = require("nvim-web-devicons").get_icon_color(self.filename, extension, { default = true })
            return " " .. icon
        end,
    },
    {
        provider = function(self)
            if self.filename ~= "" then
                local filepath = vim.fn.fnamemodify(self.filename, ":~:.")
                return " " .. filepath
            end
        end,
    },
    {
        provider = function()
            return vim.bo.readonly and "  "
        end,
    },
}

M.LineNumber = {
    provider = "   %l:%L ",
}

M.FileType = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
    condition = function()
        return vim.api.nvim_buf_get_name(0) ~= ""
    end,
    {
        provider = function(self)
            local extension = vim.fn.fnamemodify(self.filename, ":e")
            local icon, _ = require("nvim-web-devicons").get_icon_color(self.filename, extension, { default = true })
            return " " .. icon
        end,
    },
    {
        provider = function()
            return " " .. string.upper(vim.bo.filetype)
        end,
    },
}

return M
