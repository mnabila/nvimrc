local colors = require("configs.ui.heirline.color")
local M = {}

M.FileName = {
    condition = function()
        return vim.api.nvim_win_get_width(0) > 50 and vim.api.nvim_buf_get_name(0) ~= ""
    end,
    provider = function()
        local filename, modifier, readonly

        filename = vim.api.nvim_buf_get_name(0)

        if vim.api.nvim_win_get_width(0) > 160 then
            filename = vim.fn.fnamemodify(filename, ":~:.")
        else
            filename = vim.fn.fnamemodify(filename, ":t")
        end

        if vim.bo.readonly then
            readonly = " "
        else
            readonly = ""
        end

        if vim.bo.modified then
            modifier = ""
        else
            modifier = ""
        end

        return string.format(" %s %s %s ", filename, readonly, modifier)
    end,
    hl = { fg = colors.white },
}

M.FileType = {
    condition = function()
        return vim.api.nvim_win_get_width(0) > 50 and vim.api.nvim_buf_get_name(0) ~= ""
    end,
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(filename, ":e")
        local icon_str, _ = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        return string.format(" %s %s", icon_str, vim.bo.filetype:upper())
    end,
    hl = { fg = colors.black, bg = colors.white, bold = true },
}

M.LineNumber = {
    provider = "   %l:%L ",
    hl = { fg = colors.black, bg = colors.white, bold = true },
}

return M
