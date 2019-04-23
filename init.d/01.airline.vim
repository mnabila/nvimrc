" airline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" airline configuration
let g:airline_theme                        = 'gruvbox'
let g:airline#extensions#tabline#fnamemod  = ':t'
let g:airline#extensions#branch#enabled    = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tagbar#enabled    = 1
let g:airline_skip_empty_sections          = 1


" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 0


if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep     = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep                        = '▶'
  let g:airline_left_alt_sep                    = '»'
  let g:airline_right_sep                       = '◀'
  let g:airline_right_alt_sep                   = '«'
  let g:airline#extensions#branch#prefix        = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol      = '⊘'
  let g:airline#extensions#linecolumn#prefix    = '¶'
  let g:airline#extensions#paste#symbol         = 'ρ'
  let g:airline_symbols.linenr                  = '␊'
  let g:airline_symbols.branch                  = '⎇'
  let g:airline_symbols.paste                   = 'ρ'
  let g:airline_symbols.paste                   = 'Þ'
  let g:airline_symbols.paste                   = '∥'
  let g:airline_symbols.whitespace              = 'Ξ'
else
  " let g:airline#extensions#tabline#left_sep     = ''
  let g:airline#extensions#tabline#left_sep     = ''
  " let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  " let g:airline_left_sep         = ''
  let g:airline_left_sep         = ''
  " let g:airline_left_alt_sep     = ''
  let g:airline_left_alt_sep     = ''
  " let g:airline_right_sep        = ''
  let g:airline_right_sep        = ''
  " let g:airline_right_alt_sep    = ''
  let g:airline_right_alt_sep    = ''
  let g:airline_symbols.branch   = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr   = ''
endif
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
