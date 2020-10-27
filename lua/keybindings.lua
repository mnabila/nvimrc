local remap = vim.api.nvim_set_keymap

-- function check_backspace()
--     local col = vim.fn.col('.') - 1
--     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return true
--     else
--         return false
--     end
-- end

-- function show_documentation()
--     if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
--         vim.cmd('h' .. vim.fn.expand('<cword>'))
--         -- else
--         --     vim.call('CocAction("doHover")')
--     end
-- end

local keybindings = {
    -- {'mode', 'keybindings', 'command', '{noremap=bool', 'silent=bool', expr=bool}}
    
    -- disable keys
    {'n', 'Q', '<Nop>', {noremap = true, silent = true}},
    {'n', '<Left>', '<Nop>', {noremap = true, silent = true}},
    {'n', '<Right>', '<Nop>', {noremap = true, silent = true}},
    {'n', '<Up>', '<Nop>', {noremap = true, silent = true}},
    {'n', '<Down>', '<Nop>', {noremap = true, silent = true}},
    {'n', '<C-z>', '<Nop>', {noremap = true, silent = true}},

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
    {'n', '<Leader>q', '<CMD>bp<CR>:bd #<CR>', {noremap = true, silent = true}},
    {'n', '<Leader>qq', '<CMD>bufdo bd<CR>', {noremap = true, silent = true}},
    {'n', '<Leader>qa', '<CMD>bufdo bd!<CR>', {noremap = true, silent = true}},
    {'n', '<Leader>qo', '<CMD> lua delete_other_buffer()<CR>', {noremap = true, silent = true}},
    {'n', '<Leader>qi', '<CMD>bp<CR>:bd! #<CR>', {noremap = true, silent = true}},

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

    -- code formater
    {'n', '<Leader>f', '<CMD>Autoformat<CR>', {noremap = false, silent = false}},
    {'v', '<Leader>f', '<CMD>Autoformat<CR>', {noremap = false, silent = false}},
    {'n', '<Leader>F', '<Plug>(coc-format)', {noremap = false, silent = false}},
    {'v', '<Leader>F', '<Plug>(coc-format-selected)', {noremap = false, silent = false}},

    -- coc.nvim
    -- {
    --     'i',
    --     '<TAB>',
    --     'pumvisible() ? "\\<C-n>" : <SID>check_back_space() ? "\\<TAB>" : coc#refresh()',
    --     {noremap = true, silent = true},
    -- },
    -- {'i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {noremap = true, silent = true}},
    -- {'i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {noremap = true, silent = true, expr = true}},
    -- {
    --     'i',
    --     '<CR>',
    --     'pumvisible() ? coc#_select_confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"',
    --     {noremap = true, silent = true, expr = true},
    -- },
    -- {'i', '<c-space>', 'coc#refresh()', {noremap = true, silent = true}},
    -- {'i', '<A-Tab>', '<Plug>(coc-snippets-expand)', {noremap = false, silent = false}},
    -- {'n', 'K', show_documentation(), {noremap = true, silent = true}},
    -- {'n', '<Leader>rn', '<Plug>(coc-rename)', {noremap = false, silent = false}},
    -- {'n', '<Leader>[c', '<Plug>(coc-diagnostic-prev)', {noremap = false, silent = false}},
    -- {'n', '<Leader>]c', '<Plug>(coc-diagnostic-next)', {noremap = false, silent = false}},
    -- {'n', '<Leader>gd', '<Plug>(coc-definition)', {noremap = false, silent = false}},
    -- {'n', '<Leader>gi', '<Plug>(coc-implementation)', {noremap = false, silent = false}},
    -- {'n', '<Leader>gr', '<Plug>(coc-references)', {noremap = false, silent = false}},
    -- {'n', '<Leader>gtd', '<Plug>(coc-type-definition)', {noremap = false, silent = false}},
    -- {'n', '<Leader>ac', '<Plug>(coc-codeaction)', {noremap = false, silent = false}},

    -- fzf
    {'n', '<Leader><space>', '<CMD>History<CR>', {noremap = true, silent = false}},
    {'n', '<Leader>b', '<CMD>Buffers<CR>', {noremap = true, silent = false}},
    {'n', '<Leader>o', '<CMD>Files<CR>', {noremap = true, silent = false}},
    {'n', '<Leader>g', '<CMD>BTags<CR>', {noremap = true, silent = false}},
    {'n', '<Leader>m', '<CMD>Marks<CR>', {noremap = true, silent = false}},
    {'n', '<Leader><Leader>', '<CMD>Commands<CR>', {noremap = true, silent = false}},

    {'n', '<Leader><tab>', '<plug>(fzf-maps-n)', {noremap = false, silent = false}},
    {'x', '<Leader><tab>', '<plug>(fzf-maps-x)', {noremap = false, silent = false}},
    {'o', '<Leader><tab>', '<plug>(fzf-maps-o)', {noremap = false, silent = false}},

    {'i', '<C-x><C-w>', '<plug>(fzf-complete-word)', {noremap = false, silent = false}},
    {'i', '<C-x><C-p>', '<plug>(fzf-complete-path)', {noremap = false, silent = false}},
    {'i', '<C-x><C-f>', '<plug>(fzf-complete-file-ag)', {noremap = false, silent = false}},
    {'i', '<C-x><C-l>', '<plug>(fzf-complete-line)', {noremap = false, silent = false}},

    -- base64
    {'v', '<Leader>d64', 'c<C-r>=system(\'base64 -d\', @")<CR><ESC>', {noremap = false, silent = false}},
    {'v', '<Leader>e64', 'c<C-r>=system(\'base64\', @")<CR><ESC>', {noremap = false, silent = false}},

    -- others
    -- Delete in search result
    {'n', '<Leader>x', '<CMD>%s///<CR>', {noremap = false, silent = false}},

    -- Search for visually selected text
    {'v', '<Leader>v', 'y/\\V<C-R>=escape(@",\'/\\\')<CR><CR>', {noremap = false, silent = false}},

    -- TODO: convert to lua
    -- " Edit init.vim
    -- nmap <leader>ev :cd ~/.config/nvim<cr>:LuaTreeToggle<cr>

    -- " Edit dotfiles
    -- nmap <leader>ed :cd ~/Dotfiles<cr>:LuaTreeToggle<cr>
}

for _, key in pairs(keybindings) do remap(key[1], key[2], key[3], key[4]) end

vim.cmd([[
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-Tab> pumvisible() ? "\\<C-p>" : "\\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<cr>

imap <A-Tab> <Plug>(coc-snippets-expand)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent>[c <Plug>(coc-diagnostic-prev)
nmap <silent>]c <Plug>(coc-diagnostic-next)
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>gtd <Plug>(coc-type-definition)
nmap <leader>ac  <Plug>(coc-codeaction)
]])
