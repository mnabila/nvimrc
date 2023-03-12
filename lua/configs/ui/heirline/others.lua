local colors = require("configs.ui.heirline.color")
local M = {}

M.Align = { provider = "%=" }

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
    hl = { fg = colors.black, bg = colors.white, bold = true },
    update = {
        "ModeChanged",
    },
}

return M
