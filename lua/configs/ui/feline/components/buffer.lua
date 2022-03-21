local M = {}

M.name = {
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

        return string.format("   %s %s %s ", filename, readonly, modifier)
    end,
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 50 and vim.api.nvim_buf_get_name(0) ~= ""
    end,
    hl = {
        fg = "fg",
        bg = "bg",
    },
}

M.type = {
    provider = function()
        local filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(filename, ":e")
        local icon_str, _ = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
        return string.format(" %s %s ", icon_str, vim.bo.filetype:upper())
    end,
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80 and vim.api.nvim_buf_get_name(0) ~= ""
    end,
    hl = {
        fg = "bg",
        bg = "altgray",
    },
}

M.format = {
    provider = function()
        local os = vim.bo.fileformat:upper()
        local icon
        if os == "UNIX" then
            icon = " "
        elseif os == "MAC" then
            icon = " "
        else
            icon = " "
        end
        return string.format(" %s %s ", icon, os)
    end,
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80
    end,
    hl = {
        fg = "bg",
        bg = "gray",
    },
}

M.encode = {
    provider = function()
        local encode = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
        return string.format("  %s ", encode:upper())
    end,
    enabled = function()
        return vim.api.nvim_win_get_width(0) > 80
    end,
    hl = {
        fg = "bg",
        bg = "altgray",
    },
}

M.cursor_position = {
    provider = "position",
    opts = {
        padding = true,
    },
    left_sep = {
        str = "  ",
        hl = {
            bg = "yellow",
            fg = "bg",
        },
    },
    right_sep = {
        str = " ",
        hl = {
            bg = "yellow",
            fg = "bg",
        },
    },
    hl = {
        bg = "yellow",
        fg = "bg",
    },
}
return M
