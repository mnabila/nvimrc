local colors = require("configs.ui.heirline.color")
local M = {}

M.FilePath = {
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        local filepath = vim.fn.fnamemodify(filename, ":.")
        if filepath ~= "" then
            return filepath
        end
        return "unsaved"
    end,
    hl = {
        bold = false,
        strikethrough = vim.bo.modified,
    },
}

M.FileIcon = {
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(filename, ":e")
        local icon, _ = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        return icon .. " "
    end,
}

M.LineNumber = {
    provider = "   %l:%L ",
    hl = { fg = colors.black, bg = colors.white, bold = true },
}

return M
