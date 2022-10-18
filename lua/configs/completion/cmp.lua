local M = {}

local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

function M.config()
    local cmp = require("cmp")
    local window = cmp.config.window.bordered({
        border = "single",
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:IncSearch",
    })

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        completion = {
            autocomplete = { cmp.TriggerEvent.TextChanged },
        },

        window = {
            completion = window,
            documentation = window,
        },

        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            {
                name = "buffer",
                option = {
                    get_bufnrs = function()
                        return vim.api.nvim_list_bufs()
                    end,
                },
            },
            { name = "nvim_lua" },
            { name = "vsnip" },
        },

        mapping = {
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

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
