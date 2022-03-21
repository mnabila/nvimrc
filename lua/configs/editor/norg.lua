local M = {}

function M.config()
    require("neorg").setup({
        load = {
            ["core.autocommands"] = {},
            ["core.mode"] = {},
            ["core.neorgcmd"] = {},
            ["core.integrations.treesitter"] = {},
            ["core.norg.concealer"] = {},
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        home = "~/Notes/home",
                    },
                },
            },
            ["core.norg.completion"] = { config = { engine = "nvim-cmp" } },
        },
    })

    -- Set configuration for specific filetype.
    --
    local cmp = require("cmp")
    cmp.setup.filetype("norg", {
        sources = cmp.config.sources({
            { name = "neorg" }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
            { name = "buffer" },
        }),
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
