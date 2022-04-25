local ls = require("luasnip")
local M = {}

function M.config()
    local types = require("luasnip.util.types")
    ls.config.setup({
        history = true,
        -- ext_opts = {
        --     [types.choiceNode] = {
        --         active = {
        --             virt_text = { { " ", "Comment" } },
        --         },
        --     },
        -- },
    })

    vim.keymap.set("i", "<A-]>", function()
        if ls.choice_active() then
            return ls.change_choice(1)
        end
    end, { buffer = true })

    vim.keymap.set("i", "<A-[>", function()
        if ls.choice_active() then
            return ls.change_choice(-1)
        end
    end, { buffer = true })

    M.snippets()
end

function M.snippets()
    local s = ls.snippet
    local t = ls.text_node
    local f = ls.function_node
    local c = ls.choice_node

    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })

    ls.add_snippets("all", {
        s("todo", {
            c(1, {
                t("TODO(mnabila): "),
                t("ERROR(mnabila): "),
                t("INFO(mnabila): "),
                t("WARNING(mnabila): "),
                t("FIXME(mnabila): "),
                t("FIXME(everyone): "),
            }),
        }),

        s("time", {
            c(1, {
                f(function()
                    return os.date("%D - %H:%M")
                end),
                f(function()
                    return os.date("%D")
                end),
                f(function()
                    return os.date("%H:%M")
                end),
            }),
        }),
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
