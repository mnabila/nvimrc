" NERDTree configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd StdinReadPre * let s:std_in=1
" let g:NERDTreeDirArrowExpandable=''
" let g:NERDTreeDirArrowCollapsible=''
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeIgnore=['\.pyc$','^__pycache__$', '^node_modules$']

autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd FileType nerdtree setlocal signcolumn=no nocursorcolumn

" nerdtree github configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:NERDTreeIndicatorMapCustom = {
"             \ "Modified"  : "✹",
"             \ "Staged"    : "✚",
"             \ "Untracked" : "✭",
"             \ "Renamed"   : "➜",
"             \ "Unmerged"  : "═",
"             \ "Deleted"   : "✖",
"             \ "Dirty"     : "✗",
"             \ "Clean"     : "✔︎",
"             \ 'Ignored'   : '☒',
"             \ "Unknown"   : "?"
"             \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""