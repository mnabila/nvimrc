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
    local keybindings = {
        -- Buffers
        { "n", "<A-l>", "<CMD>BufferNext<CR>", { noremap = true, silent = true } },
        { "n", "<A-h>", "<CMD>BufferPrevious<CR>", { noremap = true, silent = true } },
        { "n", "<A-L>", "<CMD>BufferMoveNext<CR>", { noremap = true, silent = true } },
        { "n", "<A-H>", "<CMD>BufferMovePrevious<CR>", { noremap = true, silent = true } },
        { "n", "<Leader>q", "<CMD>BufferClose<CR>", { noremap = true, silent = true } },
        { "n", "<Leader>qq", "<CMD>bufdo BufferClose<CR>", { noremap = true, silent = true } },
        { "n", "<Leader>qa", "<CMD>bufdo BufferClose!<CR>", { noremap = true, silent = true } },
        { "n", "<Leader>qo", "<CMD>BufferCloseAllButCurrent<CR>", { noremap = true, silent = true } },
        { "n", "<A-1>", "<CMD>BufferGoto 1<CR>", { noremap = true, silent = true } },
        { "n", "<A-2>", "<CMD>BufferGoto 2<CR>", { noremap = true, silent = true } },
        { "n", "<A-3>", "<CMD>BufferGoto 3<CR>", { noremap = true, silent = true } },
        { "n", "<A-4>", "<CMD>BufferGoto 4<CR>", { noremap = true, silent = true } },
        { "n", "<A-5>", "<CMD>BufferGoto 5<CR>", { noremap = true, silent = true } },
        { "n", "<A-6>", "<CMD>BufferGoto 6<CR>", { noremap = true, silent = true } },
        { "n", "<A-7>", "<CMD>BufferGoto 7<CR>", { noremap = true, silent = true } },
        { "n", "<A-8>", "<CMD>BufferGoto 8<CR>", { noremap = true, silent = true } },
        { "n", "<A-9>", "<CMD>BufferGoto 9<CR>", { noremap = true, silent = true } },
        { "n", "<A-0>", "<CMD>BufferLast<CR>", { noremap = true, silent = true } },
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
