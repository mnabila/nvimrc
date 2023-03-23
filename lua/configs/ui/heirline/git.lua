local conditions = require("heirline.conditions")
local colors = require("configs.ui.heirline.color")
local M = {}

M.Branch = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,
    hl = { fg = colors.black, bg = colors.white },
    {
        -- git branch name
        provider = function(self)
            return string.format("  %s ", self.status_dict.head)
        end,
        hl = { bold = true },
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and string.format("+%d ", count)
        end,
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and string.format("-%d ", count)
        end,
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and string.format("~%d ", count)
        end,
    },
}
return M
