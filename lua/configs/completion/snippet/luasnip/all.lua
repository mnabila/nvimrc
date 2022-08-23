local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

local snippet = {
    s(
        "todo",
        fmt("{task}({}): {}", {
            i(2, "mnabila"),
            i(3),
            task = c(1, { t("TODO"), t("ERROR"), t("FIXME") }),
        })
    ),

    s("time", {
        c(1, {
            f(function()
                return os.date()
            end),
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
}

return snippet
