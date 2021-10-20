local keymap = vim.api.nvim_set_keymap

local function set_keybindings()
    local noremap_silent = { noremap = true, silent = true }
    local remap_silent = { noremap = false, silent = true }
    local remap_nosilent = { noremap = false, silent = true }
    local keybindings = {
        -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}

        -- disable keys
        { "n", "Q", "<Nop>", noremap_silent },
        { "n", "<Left>", "<Nop>", noremap_silent },
        { "n", "<Right>", "<Nop>", noremap_silent },
        { "n", "<Up>", "<Nop>", noremap_silent },
        { "n", "<Down>", "<Nop>", noremap_silent },
        { "n", "<C-z>", "<Nop>", noremap_silent },

        -- resize window
        { "n", "<C-Left>", "<CMD>vertical resize +5<CR>", noremap_silent },
        { "n", "<C-Up>", "<CMD>resize -5<CR>", noremap_silent },
        { "n", "<C-Right>", "<CMD>vertical resize -5<CR>", noremap_silent },
        { "n", "<C-Down>", "<CMD>resize +5<CR>", noremap_silent },


        -- split window
        { "n", "<C-A-k>", "<C-w>t<C-w>K", remap_silent },
        { "n", "<C-A-h>", "<C-w>t<C-w>H", remap_silent },

        -- terminal mode
        { "t", "<Esc>", "<C-\\><C-n>", noremap_silent },

        -- nvim tree.lua
        { "n", "`", '<CMD>lua require("utils.nvimtree").toggle()<CR>', noremap_silent },

        -- base64
        {
            "v",
            "<Leader>d6",
            "c<C-r>=system('base64 -d', @\")<CR><ESC>",
            remap_nosilent,
        },
        {
            "v",
            "<Leader>e6",
            "c<C-r>=system('base64', @\")<CR><ESC>",
            remap_nosilent,
        },

        -- emmet-vim
        { "i", "<A-Tab>", "<C-y>,", remap_silent },
        { "v", "<A-Tab>", "<C-y>,", remap_silent },

        -- Delete in search result
        { "n", "<Leader>x", "<CMD>%s///<CR>", remap_silent },

        -- Search for visually selected text
        { "v", "<Leader>v", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", remap_silent },

        -- format.nvim
        { "n", "<leader>F", "<CMD>FormatWrite<CR>", remap_silent },
    }

    for _, key in pairs(keybindings) do
        keymap(key[1], key[2], key[3], key[4])
    end
end
set_keybindings()
