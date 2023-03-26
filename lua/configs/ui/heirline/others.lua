local colors = require("configs.ui.heirline.color")
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
            n = "NURUL",
            i = "INSERET",
            c = "COMAN",
            V = "PISUAL",
            t = "TERMINUL",
        },
    },
    provider = function(self)
        return string.format("  %s ", self.mode_names[self.mode])
    end,
    hl = { fg = colors.black, bg = colors.white, bold = true },
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
        fg = colors.white,
        bold = true,
    },
}

return M
