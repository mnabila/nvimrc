local M = {}

M.Separator = {
    provider = "%=",
}

M.ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
        if not self.once then
            vim.api.nvim_create_autocmd("ModeChanged", {
                pattern = "*:*o",
                command = "redrawstatus",
            })
            self.once = true
        end
    end,
    static = {
        mode_names = {
            n = "NORMAL",
            i = "INSERT",
            c = "COMMAND",
            V = "VISUAL",
            t = "TERMINAL",
        },
    },
    provider = function(self)
        return string.format("  %s ", self.mode_names[self.mode])
    end,
    hl = { fg = "black", bg = "white", bold = true },
    update = {
        "ModeChanged",
    },
}

M.Navic = {
    condition = function()
        return require("nvim-navic").is_available()
    end,
    provider = function()
        return " " .. require("nvim-navic").get_location({ highlight = false })
    end,
    update = "CursorMoved",
    hl = {
        fg = "gray",
    },
}

M.TabLineOffset = {
    condition = function(self)
        local win = vim.api.nvim_tabpage_list_wins(0)[1]
        local bufnr = vim.api.nvim_win_get_buf(win)
        self.winid = win

        if vim.bo[bufnr].filetype == "neo-tree" then
            self.title = "File Manager"
            return true
        end
    end,
    provider = function(self)
        local title = self.title
        local width = vim.api.nvim_win_get_width(self.winid)
        local pad = math.ceil((width - #title) / 2)
        return string.rep(" ", pad) .. title .. string.rep(" ", pad)
    end,
    hl = {
        fg = "white",
        bold = true,
    },
}
return M
