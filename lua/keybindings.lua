local keymap = vim.api.nvim_set_keymap

local function set_keybindings()
    local keybindings = {
        -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}

        -- disable keys
        { "n", "Q", "<Nop>", { noremap = true, silent = true } },
        { "n", "<Left>", "<Nop>", { noremap = true, silent = true } },
        { "n", "<Right>", "<Nop>", { noremap = true, silent = true } },
        { "n", "<Up>", "<Nop>", { noremap = true, silent = true } },
        { "n", "<Down>", "<Nop>", { noremap = true, silent = true } },
        { "n", "<C-z>", "<Nop>", { noremap = true, silent = true } },

        -- resize window
        { "n", "<C-Left>", "<CMD>vertical resize +5<CR>", { noremap = true, silent = true } },
        { "n", "<C-Up>", "<CMD>resize -5<CR>", { noremap = true, silent = true } },
        { "n", "<C-Right>", "<CMD>vertical resize -5<CR>", { noremap = true, silent = true } },
        { "n", "<C-Down>", "<CMD>resize +5<CR>", { noremap = true, silent = true } },

        -- Buffers
        { "n", "<A-l>", "<CMD>BufferNext<CR>", { noremap = true, silent = true } },
        { "n", "<A-h>", "<CMD>BufferPrevious<CR>", { noremap = true, silent = true } },
        { "n", "<A-L>", "<CMD>BufferMovePrevious<CR>", { noremap = true, silent = true } },
        { "n", "<A-H>", "<CMD>BufferMoveNext<CR>", { noremap = true, silent = true } },
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

        -- split window
        { "n", "<C-A-k>", "<C-w>t<C-w>K", { noremap = false, silent = true } },
        { "n", "<C-A-h>", "<C-w>t<C-w>H", { noremap = false, silent = true } },

        -- terminal mode
        { "t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true } },

        -- nvim tree.lua
        { "n", "`", "<CMD>NvimTreeToggle<CR>", { noremap = true, silent = true } },
        { "n", "<A-`>", "<CMD>NvimTreeFindFile<CR>", { noremap = true, silent = true } },

        -- telescope
        {
            "n",
            "<Leader><space>",
            '<CMD>lua require("telescope.builtin").oldfiles({file_ignore_patterns = {"/usr/share/nvim/runtime/*"}})<CR>',
            { noremap = true, silent = false },
        },
        {
            "n",
            "<Leader>b",
            '<CMD>lua require("telescope.builtin").buffers()<CR>',
            { noremap = true, silent = false },
        },
        {
            "n",
            "<Leader>o",
            '<CMD>lua require("telescope.builtin").find_files()<CR>',
            { noremap = true, silent = false },
        },
        {
            "n",
            "<Leader>m",
            '<cmd>lua require("telescope.builtin").marks()<cr>',
            { noremap = true, silent = false },
        },
        {
            "n",
            "<Leader><Leader>",
            '<CMD>lua require("telescope.builtin").builtin({previewer = false})<CR>',
            { noremap = true, silent = false },
        },
        {
            "n",
            "<Leader>k",
            '<CMD>lua require("telescope.builtin").keymaps()<CR>',
            { noremap = true, silent = false },
        },
        {
            "n",
            "<Leader>/",
            '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
            { noremap = true, silent = false },
        },
        {
            "n",
            "<Leader>?",
            '<CMD>lua require("telescope.builtin").grep_string()<CR>',
            { noremap = true, silent = false },
        },

        -- base64
        {
            "v",
            "<Leader>d6",
            "c<C-r>=system('base64 -d', @\")<CR><ESC>",
            { noremap = false, silent = false },
        },
        {
            "v",
            "<Leader>e6",
            "c<C-r>=system('base64', @\")<CR><ESC>",
            { noremap = false, silent = false },
        },

        -- emmet-vim
        { "i", "<A-Tab>", "<C-y>,", { noremap = false, silent = false } },
        { "v", "<A-Tab>", "<C-y>,", { noremap = false, silent = false } },

        -- Delete in search result
        { "n", "<Leader>x", "<CMD>%s///<CR>", { noremap = false, silent = false } },

        -- Search for visually selected text
        { "v", "<Leader>v", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", { noremap = false, silent = false } },

        -- format.nvim
        { "n", "<leader>F", "<CMD>FormatWrite<CR>", { noremap = false, silent = false } },
    }

    for _, key in pairs(keybindings) do
        keymap(key[1], key[2], key[3], key[4])
    end
end
vim.cmd('let mapleader=","')
set_keybindings()
