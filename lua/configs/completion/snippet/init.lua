local ls = require("luasnip")
local types = require("luasnip.util.types")

local M = {}

function M.config()
    ls.config.setup({
        history = true,
        update_events = "TextChanged,TextChangedI",
        delete_check_events = "TextChanged",
        ext_opts = {
            [types.choiceNode] = {
                active = {
                    virt_text = { { "❰ Choice Node", "Comment" } },
                },
            },
        },
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

    vim.keymap.set("i", "<A-space>", function()
        if ls.choice_active() then
            return require("luasnip.extras.select_choice")()
        end
    end, { buffer = true })

    M.snippets()
end

function M.snippets()
    ls.add_snippets("all", require("configs.completion.snippet.luasnip.all"))
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.loop.os_homedir() .. "/.config/nvim/lua/configs/completion/snippet/vscode" } })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
