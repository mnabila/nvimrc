"" Vim Keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Leader
let mapleader=','

"" Disable arrow
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
no <down> <Nop>
no <C-left> <Nop>
no <C-right> <Nop>
no <C-up> <Nop>
no <C-down> <Nop>
no <C-z> <Nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

"" For move to each window
nmap <C-h> <C-w><C-h>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>

"" Arrow keys resize windows
nnoremap <Left> :vertical resize +5<CR>
nnoremap <Up> :resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>
nnoremap <Down> :resize -5<CR>

"" For move to each buffer
nnoremap <A-l> :bn<cr>
nnoremap <A-h> :bp<cr>
nnoremap <leader>q :bp<cr>:bd #<cr>
nnoremap <leader>qq :bufdo bd<cr>:Startify<cr>
nnoremap <leader>qa :bufdo bd!<cr>:Startify<cr>

"" For move to each tab
nmap <A-H> :tabNext<cr>
nmap <A-L> :tabnext<cr>
nmap <A-N> :tabnew<cr>
nmap <A-Q> :tabclose<cr>

"" Line bubbling
nmap <A-J> ]e
nmap <A-K> [e

"" tonggle split
nmap <C-A-k> <C-w>t<C-w>K
nmap <C-A-h> <C-w>t<C-w>H

"" omni copletion
imap <C-Space> <C-x><C-o>

"" Terminal mode keybinding
tnoremap <Esc> <C-\><C-n>


"" NERDTree
map <F2> :NERDTreeToggle<CR>
map <C-\> :NERDTreeToggle<CR>

"" Git fugitif
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

"" Commentary
map <Leader>/ :Commentary<CR>

"" Autoformat
nmap <Leader>f :Autoformat<CR>
nmap <Leader>F <Plug>(coc-format)
vmap <Leader>F <Plug>(coc-format-selected)

"" Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <c-space> coc#refresh()

imap <A-Tab> <Plug>(coc-snippets-expand)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

"" Indent guides
nmap <silent> <Leader>ig :IndentGuidesToggle<CR>

"" color picker
let g:vcoolor_map = '<Leader>c'
let g:vcool_ins_rgb_map = '<Leader>cr'
let g:vcool_ins_hsl_map = '<Leader>ch'
let g:vcool_ins_rgba_map = '<Leader>cR'

"" Tagbar
noremap <Leader>tt :TagbarToggle<CR>
noremap <F3> :TagbarToggle<CR>

"" File header
nnoremap <leader>h :AddHeader<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

