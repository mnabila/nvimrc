local neogit = require("neogit")

neogit.setup({
    disable_signs = false,
    -- customize displayed signs
    signs = {
        -- { CLOSED, OPENED }
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
    },
})
