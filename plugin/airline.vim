"" vim-airline {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["vim-airline"]')
  let airline#extensions#coc#error_symbol       = 'E:'
  let airline#extensions#coc#stl_format_err     = '%E{[%e(#%fe)]}'
  let airline#extensions#coc#stl_format_warn    = '%W{[%w(#%fw)]}'
  let airline#extensions#coc#warning_symbol     = 'W:'
  let g:airline#extensions#branch#enabled       = 1
  let g:airline#extensions#branch#vcs_priority  = ['git', 'mercurial']
  let g:airline#extensions#coc#enabled          = 1
  let g:airline#extensions#cursormode#enabled   = 1
  let g:airline#extensions#tabline#enabled      = 1
  let g:airline#extensions#tabline#formatter    = 'unique_tail'
  let g:airline#extensions#tabline#left_alt_sep = ''
  let g:airline#extensions#tabline#left_sep     = ''
  " let g:airline_extensions                      = ['branch', 'tabline', 'coc', 'virtualenv', 'tagbar', 'fugitiveline']
  let g:airline_left_sep                        = ''
  let g:airline_right_sep                       = ''
  let g:airline_theme                           = 'gruvbox'

  " function! CocCurrentFunction()
  "   return get(b:, 'coc_current_function', '')
  " endfunction

  " call airline#parts#define('coc_function', {'function': 'CocCurrentFunction'})

  " function! AirlineInit()
  "   let g:airline_section_a = airline#section#create(['mode', 'iminsert', 'paste'])
  "   let g:airline_section_x = airline#section#create_left(['coc_function'])
  "   let g:airline_section_c = airline#section#create(['%{getcwd()}'])
  " endfunction
  " autocmd User AirlineAfterInit call AirlineInit()
endif
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
