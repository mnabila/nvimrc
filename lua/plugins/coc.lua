local remap = vim.api.nvim_set_keymap

vim.g.coc_node_path = "/usr/bin/node"
vim.g.coc_filetype_map = {['html.swig'] = 'html', ['jinja2.html'] = 'html', wxss = 'css', sass = 'css'}
vim.g.coc_global_extensions = {
    'coc-clangd',
    'coc-css',
    'coc-emmet',
    'coc-go',
    'coc-html',
    'coc-json',
    'coc-marketplace',
    'coc-phpls',
    'coc-prettier',
    'coc-python',
    'coc-sh',
    'coc-snippets',
    'coc-tsserver',
    'coc-vetur',
    'coc-vimlsp',
    'coc-word',
    'coc-texlab',
    'coc-yaml',
}
local au = [[
    autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd User CocLocationsChange CocList --normal -A location
]]
vim.cmd(au)

function check_backspace()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

function show_documentation()
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    else
        vim.cmd('call CocAction("doHover")')
    end
end

local function set_keybindings()
    local keybindings = {
        {
            'i',
            '<TAB>',
            'pumvisible() ? "<C-n>" : luaeval(check_backspace())  ? "<TAB>" : coc#refresh()',
            {noremap = true, silent = true, expr = true},
        },
        {'i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<C-h>"', {noremap = true, silent = true, expr = true}},
        {
            'i',
            '<CR>',
            'pumvisible() ? coc#_select_confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"',
            {noremap = true, silent = true, expr = true},
        },
        {'i', '<c-space>', 'coc#refresh()', {noremap = true, silent = true, expr = true}},
        {'i', '<A-Tab>', '<Plug>(coc-snippets-expand)', {noremap = false, silent = false}},
        {'n', 'K', '<CMD>lua show_documentation()<CR>', {noremap = true, silent = true}},
        {'n', '<Leader>rn', '<Plug>(coc-rename)', {noremap = false, silent = false}},
        {'n', '<Leader>[c', '<Plug>(coc-diagnostic-prev)', {noremap = false, silent = false}},
        {'n', '<Leader>]c', '<Plug>(coc-diagnostic-next)', {noremap = false, silent = false}},
        {'n', '<Leader>gd', '<Plug>(coc-definition)', {noremap = false, silent = false}},
        {'n', '<Leader>gi', '<Plug>(coc-implementation)', {noremap = false, silent = false}},
        {'n', '<Leader>gr', '<Plug>(coc-references)', {noremap = false, silent = false}},
        {'n', '<Leader>gtd', '<Plug>(coc-type-definition)', {noremap = false, silent = false}},
        {'n', '<Leader>ac', '<Plug>(coc-codeaction)', {noremap = false, silent = false}},
        {'n', 'F', '<Plug>(coc-format)', {noremap = false, silent = false}},
        {'v', 'F', '<Plug>(coc-format-selected)', {noremap = false, silent = false}},
    }
    for _, key in pairs(keybindings) do remap(key[1], key[2], key[3], key[4]) end
end
set_keybindings()
