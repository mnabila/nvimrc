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
            -- { name = "copilot" },
        },

        mapping = {
            ["<Tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end,
            ["<S-Tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end,
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        },
    })

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
