local M = {}

function M.config()
    require("nvim-biscuits").setup({
        default_config = {
            min_distance = 5,
            max_length = 80,
            prefix_string = "  ",
        },
    })
end

return M
