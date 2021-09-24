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
            completeopt = vim.opt.completeopt,
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
            ["<TAB>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
            ["<S-TAB>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.close(),
            ["<CR>"] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
        },
    })

    require("nvim-autopairs.completion.cmp").setup({
        map_cr = true,
        map_complete = true,
        auto_select = true,
        insert = false,
        map_char = {
            all = "(",
            tex = "{",
        },
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
