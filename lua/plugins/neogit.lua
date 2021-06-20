local M = {}

function M.config()
    require("neogit").setup({
        disable_signs = false,
        -- customize displayed signs
        signs = {
            -- { CLOSED, OPENED }
            section = { "", "" },
            item = { "", "" },
            hunk = { "", "" },
        },
    })
end

return M
