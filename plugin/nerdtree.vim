"" nerdtree {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["nerdtree"]')
  autocmd StdinReadPre * let s:std_in = 1
  let g:NERDTreeDirArrowExpandable    = "\u00a0"
  let g:NERDTreeDirArrowCollapsible   = "\u00a0"
  let NERDTreeIgnore                  = ['\.pyc$','^__pycache__$']
  autocmd StdinReadPre * let s:std_in = 1

  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd FileType nerdtree setlocal signcolumn=no nocursorcolumn
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""