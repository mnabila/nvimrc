local M = {}

function M.config()
    vim.g.bufferline = {
        animation = false,
        auto_hide = false,
        icons = true,
        icon_separator_active = "",
        icon_separator_inactive = "",
        icon_close_tab = "",
        icon_close_tab_modified = " ",
        closable = true,
        clickable = true,
        semantic_letters = true,
        maximum_padding = 2,
        no_name_title = " empty",
    }
    M.keymap()
end

function M.keymap()
    local options = { noremap = true, silent = true }
    local keybindings = {
        -- Buffers
        { "n", "<A-l>", "<CMD>BufferNext<CR>", options },
        { "n", "<A-h>", "<CMD>BufferPrevious<CR>", options },
        { "n", "<A-L>", "<CMD>BufferMoveNext<CR>", options },
        { "n", "<A-H>", "<CMD>BufferMovePrevious<CR>", options },
        { "n", "<Leader>q", "<CMD>BufferClose<CR>", options },
        { "n", "<Leader>qq", "<CMD>bufdo BufferClose<CR>", options },
        { "n", "<Leader>qa", "<CMD>bufdo BufferClose!<CR>", options },
        { "n", "<Leader>qo", "<CMD>BufferCloseAllButCurrent<CR>", options },
        { "n", "<A-1>", "<CMD>BufferGoto 1<CR>", options },
        { "n", "<A-2>", "<CMD>BufferGoto 2<CR>", options },
        { "n", "<A-3>", "<CMD>BufferGoto 3<CR>", options },
        { "n", "<A-4>", "<CMD>BufferGoto 4<CR>", options },
        { "n", "<A-5>", "<CMD>BufferGoto 5<CR>", options },
        { "n", "<A-6>", "<CMD>BufferGoto 6<CR>", options },
        { "n", "<A-7>", "<CMD>BufferGoto 7<CR>", options },
        { "n", "<A-8>", "<CMD>BufferGoto 8<CR>", options },
        { "n", "<A-9>", "<CMD>BufferGoto 9<CR>", options },
        { "n", "<A-0>", "<CMD>BufferLast<CR>", options },
    }
    for _, key in pairs(keybindings) do
        vim.api.nvim_set_keymap(key[1], key[2], key[3], key[4])
    end
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
