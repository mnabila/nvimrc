local M = {}

function M.config()
    local cmp = require("cmp")
    vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },

        completion = {
            autocomplete = { cmp.TriggerEvent.TextChanged },
        },

        documentation = {
            border = "single",
            winhighlight = "NormalFloat:CmpDocumentation,FloatBorder:CmpDocumentationBorder",
        },

        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
            { name = "nvim_lua" },
            { name = "vsnip" },
        },

        mapping = {
            ["<S-TAB>"] = cmp.mapping.select_prev_item(),
            ["<TAB>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        },
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
