"" indentLine {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["indentLine"]')
  let g:indentLine_char            = '╏'
  let g:indentLine_faster          = 1
  let g:indentLine_setColors       = 1
  let g:indentLine_fileTypeExclude = [
        \ 'help', 'nerdtree', 'startify', 'Preview','__doc__', 'peekaboo',
        \ 'man', 'trans', 'fzf', 'markdown'
        \ ]
  let g:indentLine_bufTypeExclude = [
        \ 'help', 'terminal' 
        \ ]
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
