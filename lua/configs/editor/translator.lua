local M = {}

function M.config()
    vim.g.translator_default_engines = { "google" }
    vim.g.translator_target_lang = "en"
    vim.g.translator_window_type = "popup"
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
