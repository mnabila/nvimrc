local M = {}

function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

function M.config()
    local cmp = require("cmp")

    vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"

    cmp.setup({
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

return M
