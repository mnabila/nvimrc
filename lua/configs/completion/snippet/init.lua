local ls = require("luasnip")
local M = {}

function M.config()
    ls.config.setup({
        history = true,
    })

    vim.keymap.set("i", "<C-u>", require("luasnip.extras.select_choice"))
    M.snippets()
end

function M.snippets()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
    ls.add_snippets("all", require("configs.completion.snippet.all")())
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
