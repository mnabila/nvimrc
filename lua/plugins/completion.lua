local keymap = vim.api.nvim_set_keymap

function Check_backspace()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

vim.g.compe_enabled = true
vim.g.compe_min_length = 2
vim.g.compe_auto_preselect = false
vim.g.compe_source_timeout = 200
vim.g.compe_incomplete_delay = 400

keymap('i', '<CR>', table.concat {
    'pumvisible()',
    '? complete_info()["selected"] != "-1"',
    '? compe#confirm(lexima#expand("<LT>CR>", "i"))',
    ': "<C-g>u".lexima#expand("<LT>CR>", "i")',
    ': v:lua.Util.check_html_char() ? lexima#expand("<LT>CR>", "i")."<ESC>O"',
    ': lexima#expand("<LT>CR>", "i")'
}, {silent = true, expr = true})

keymap('i', '<Tab>',
       'pumvisible() ? "<C-n>" : v:lua.Check_backspace() ? "<Tab>" : compe#confirm(lexima#expand("<LT>CR>", "i"))',
       {silent = true, noremap = true, expr = true})
keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', {noremap = true, expr = true})
keymap('i', '<C-space>', '<C-r>=compe#complete()<CR>', {noremap = false, silent = true})

-- lsp completion source
require('compe_nvim_lsp').attach()
-- buffer completion source
require('compe'):register_lua_source('buffer', require 'compe_buffer')

vim.api.nvim_command('call compe#source#vim_bridge#register("path", compe_path#source#create())')

vim.cmd("augroup Compe")
vim.cmd("au!")
vim.cmd("au BufEnter * let g:compe_enabled = v:true")
vim.cmd("au FileType TelescopePrompt let g:compe_enabled = v:false")
vim.cmd("augroup END")
