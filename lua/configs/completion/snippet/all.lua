local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node
local c = ls.choice_node
local i = ls.insert_node

local function snippet()
    return {
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

        s(
            "time",
            c(1, {
                t(os.date("%c")),
                t(os.date("%D - %H:%M")),
                t(os.date("%Y-%m-%d")),
                t(os.date("%H:%M")),
            })
        ),
    }
end

return setmetatable({}, {
    __call = function()
        return snippet()
    end,
})
