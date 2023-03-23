local colors = require("configs.ui.heirline.color")
local M = {}

M.FileIcon = {
    init = function(self)
        self.extension = vim.fn.fnamemodify(self.filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(self.filename, self.extension, { default = true })
    end,
    provider = function(self)
        return " " .. self.icon
    end,
}

M.FileName = {
    provider = function(self)
        local filename = vim.fn.fnamemodify(self.filename, ":t")
        if filename == "" then
            return " untitled"
        end
        return " " .. filename
    end,
}

M.LineNumber = {
    provider = "   %l:%L ",
    hl = { fg = colors.black, bg = colors.white, bold = true },
}

M.BufBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    M.FileIcon,
    M.FileName,
    {
        provider = " ",
    },
    hl = function(self)
        if self.is_active then
            return { fg = colors.white, bold = true }
        end
        return { fg = colors.gray }
    end,
}

return M
