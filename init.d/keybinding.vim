"" Keyboard Mapping

"" leader
let mapleader=','


"" disable 
nmap Q <Nop>

"" Disable arrow
nnoremap  <left> <Nop>
nnoremap <right> <Nop>
nnoremap    <up> <Nop>
nnoremap  <down> <Nop>
nnoremap   <C-z> <Nop>

"" Arrow keys resize windows
noremap <silent> <C-Left> :vertical resize +5<cr>
noremap <silent> <C-Up> :resize -5<cr>
noremap <silent> <C-Right> :vertical resize -5<cr>
noremap <silent> <C-Down> :resize +5<cr>

"" Buffers
noremap <A-l> :bn<cr>
noremap <A-h> :bp<cr>
noremap <A-L> :bl<cr>
noremap <A-H> :bf<cr>
noremap <leader>q :bp<cr>:bd #<cr>
noremap <leader>qq :bufdo bd<cr>
noremap <leader>qa :bufdo bd!<cr>
noremap <leader>qo :call buffer#DeleteOnly()<cr>
noremap <leader>qi :bp<cr>:bd! #<cr>

"" Tab management
" nmap <A-H> :tabNext<cr>
" nmap <A-L> :tabnext<cr>
" nmap <A-N> :tabnew<cr>
" nmap <A-Q> :tabclose<cr>

"" Line bubbling
nmap <A-j> ]e
nmap <A-k> [e

"" Split
nmap <C-A-k> <C-w>t<C-w>K
nmap <C-A-h> <C-w>t<C-w>H

"" Terminal-mode
tnoremap <Esc> <C-\><C-n>

"" File manager
noremap ` :LuaTreeToggle<cr>
noremap <A-`> :LuaTreeFindFile<cr>
" noremap <A-`> :Defx `expand('%:p:h')` -search=`expand('%:p')`<cr>

"" Git fugitif
noremap <leader>ga  :Gwrite<cr>
noremap <leader>gc  :Gcommit<cr>
noremap <leader>gsh :Gpush<cr>
noremap <leader>gll :Gpull<cr>
noremap <leader>gs  :Gstatus<cr>
noremap <leader>gb  :Gblame<cr>
noremap <leader>gd  :Gvdiff<cr>
noremap <leader>gr  :Gremove<cr>

"" Autoformat
nmap <leader>f :Autoformat<cr>
vmap <leader>f :Autoformat<cr>
nmap <leader>F <Plug>(coc-format)
vmap <leader>F <Plug>(coc-format-selected)

"" Coc
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

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
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

"" color picker
let g:vcoolor_map        = '<leader>c'
let g:vcool_ins_rgb_map  = '<leader>cr'
let g:vcool_ins_hsl_map  = '<leader>ch'
let g:vcool_ins_rgba_map = '<leader>cR'

"" FZF
nnoremap <leader><space> :History<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>o :Files<cr>
nnoremap <leader>g :BTags<cr>
nnoremap <leader>m :Marks<cr>
nnoremap <leader><leader> :Commands<cr>

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <C-x><C-w> <plug>(fzf-complete-word)
imap <C-x><C-p> <plug>(fzf-complete-path)
imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

" Vim-translator
nmap <silent> <leader>t <Plug>TranslateW
nmap <silent> <leader>tr <Plug>TranslateR
nmap <silent> <leader>tx <Plug>TranslateX
vmap <silent> <leader>t <Plug>TranslateWV
vmap <silent> <leader>tr <Plug>TranslateRV

" Base64 encoding
vnoremap <leader>d64 c<c-r>=system('base64 -d', @")<cr><esc>
vnoremap <leader>e64 c<c-r>=system('base64', @")<cr><esc>

" Edit init.vim
nmap <leader>ev :cd ~/.config/nvim<cr>:LuaTreeToggle<cr>

" Edit dotfiles
nmap <leader>ed :cd ~/Dotfiles<cr>:LuaTreeToggle<cr>

" Search for visually selected text
vnoremap <leader>v y/\V<C-R>=escape(@",'/\')<cr><cr>

" Delete in search result
nmap <leader>x :%s///<cr>
