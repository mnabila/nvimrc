local keymap = vim.api.nvim_set_keymap

local set_keybindings = function()
    local keybindings = {
        -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}

        -- disable keys
        {'n', 'Q', '<Nop>', {noremap = true, silent = true}},
        {'n', '<Left>', '<Nop>', {noremap = true, silent = true}},
        {'n', '<Right>', '<Nop>', {noremap = true, silent = true}},
        {'n', '<Up>', '<Nop>', {noremap = true, silent = true}},
        {'n', '<Down>', '<Nop>', {noremap = true, silent = true}},
        {'n', '<C-z>', '<Nop>', {noremap = true, silent = true}},

        -- reload configuration
        {'n', '<Leader>r', '<CMD>source ~/.config/nvim/init.vim<CR>', {noremap = true, silent = false}},

        -- resize window
        {'n', '<C-Left>', '<CMD>vertical resize +5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Up>', '<CMD>resize -5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Right>', '<CMD>vertical resize -5<CR>', {noremap = true, silent = true}},
        {'n', '<C-Down>', '<CMD>resize +5<CR>', {noremap = true, silent = true}},

        -- Buffers
        {'n', '<A-l>', '<CMD>bn<CR>', {noremap = true, silent = true}},
        {'n', '<A-h>', '<CMD>bp<CR>', {noremap = true, silent = true}},
        {'n', '<A-L>', '<CMD>bl<CR>', {noremap = true, silent = true}},
        {'n', '<A-H>', '<CMD>bf<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>q', '<CMD>BufferClose<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>qq', '<CMD>BufferWipeout<CR>', {noremap = true, silent = true}},
        -- {'n', '<Leader>qa', '<CMD>bufdo bd!<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>qo', '<CMD>BufferCloseAllButCurrent<CR>', {noremap = true, silent = true}},
        -- {'n', '<Leader>qi', '<CMD>bp<CR>:bd! #<CR>', {noremap = true, silent = true}},

        -- line bubbling
        {'n', '<A-j>', ']e', {noremap = false, silent = true}},
        {'n', '<A-k>', '[e', {noremap = false, silent = true}},

        -- split window
        {'n', '<C-A-k>', '<C-w>t<C-w>K', {noremap = false, silent = true}},
        {'n', '<C-A-h>', '<C-w>t<C-w>H', {noremap = false, silent = true}},

        -- terminal mode
        {'t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = true}},

        -- nvim tree.lua
        {'n', '`', '<CMD>LuaTreeToggle<CR>', {noremap = true, silent = false}},
        {'n', '<A-`>', '<CMD>LuaTreeFindFile<CR>', {noremap = true, silent = false}},

        -- git
        {'n', '<Leader>ga', '<CMD>Gwrite<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gc', '<CMD>Gcommit<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gsh', '<CMD>Gpush<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gll', '<CMD>Gpull<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gs', '<CMD>Gstatus<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gb', '<CMD>Gblame<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gd', '<CMD>Gvdiff<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>gr', '<CMD>Gremove<CR>', {noremap = true, silent = false}},

        -- code formatter
        {'n', '<Leader>f', '<CMD>FormatWrite<CR>', {noremap = false, silent = false}},
        {'v', '<Leader>f', '<CMD>FormatWrite<CR>', {noremap = false, silent = false}},

        -- telescope
        {'n', '<Leader><space>', '<CMD>lua require("telescope.builtin").oldfiles({file_ignore_patterns = {"/usr/share/nvim/runtime/*"}})<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>b', '<CMD>lua require("telescope.builtin").buffers()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>o', '<CMD>lua require("telescope.builtin").find_files()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>m', '<CMD>lua require("telescope.builtin").marks()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader><Leader>', '<CMD>lua require("telescope.builtin").commands()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>k', '<CMD>lua require("telescope.builtin").keymaps()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>/', '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', {noremap = true, silent = false}},
        {'n', '<Leader>?', '<CMD>lua require("telescope.builtin").grep_string()<CR>', {noremap = true, silent = false}},

        -- base64
        {'v', '<Leader>d64', 'c<C-r>=system(\'base64 -d\', @")<CR><ESC>', {noremap = false, silent = false}},
        {'v', '<Leader>e64', 'c<C-r>=system(\'base64\', @")<CR><ESC>', {noremap = false, silent = false}},

        -- emmet-vim
        {'i', '<A-Tab>', '<C-y>,', {noremap = false, silent = false}},
        {'v', '<A-Tab>', '<C-y>,', {noremap = false, silent = false}},

        -- others
        -- Delete in search result
        {'n', '<Leader>x', '<CMD>%s///<CR>', {noremap = false, silent = false}},

        -- Search for visually selected text
        {'v', '<Leader>v', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', {noremap = false, silent = false}}

        -- TODO: convert to lua
        -- " Edit init.vim
        -- nmap <leader>ev :cd ~/.config/nvim<cr>:LuaTreeToggle<cr>

        -- " Edit dotfiles
        -- nmap <leader>ed :cd ~/Dotfiles<cr>:LuaTreeToggle<cr>
    }

    for _, key in pairs(keybindings) do keymap(key[1], key[2], key[3], key[4]) end
end
vim.cmd('let mapleader=","')
set_keybindings()
