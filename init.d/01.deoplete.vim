" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Configuring
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_refresh_always = 1

" call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
" call deoplete#custom#option({
"             \ 'auto_complete_delay': 0,
"             \ 'auto_refresh_delay': 5,
"             \ 'autocomplete': v:true,
"             \ 'camel_case': v:true,
"             \ 'on_insert_enter': v:true,
"             \ 'on_text_changed_i': v:true,
"             \ 'refresh_always': v:true,
"             \ 'skip_multibyte': v:true,
"             \ 'smart_case': v:true
"             \ })

" function! Multiple_cursors_before()
"     let g:deoplete#disable_auto_complete = 1
" endfunction
" function! Multiple_cursors_after()
"     let g:deoplete#disable_auto_complete = 0
" endfunction

" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" LanguageClient
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" call deoplete#custom#source('LanguageClient',
"             \ 'min_pattern_length',
"             \ 2)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jedi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:deoplete#sources#jedi#statement_length = 100 " Sets the maximum length of completion description text
" let g:deoplete#sources#jedi#enable_typeinfo  = 1   " Enables type information of completions
" let g:deoplete#sources#jedi#show_docstring   = 1   " Shows docstring in preview window
" let g:python_host_prog                       = '/usr/bin/python2'
" let g:python3_host_prog                      = '/usr/bin/python'

" JavaScript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:deoplete#sources#ternjs#tern_bin = '/usr/bin/tern'
" let g:deoplete#sources#ternjs#timeout = 1
" let g:deoplete#sources#ternjs#types = 1
" let g:deoplete#sources#ternjs#depths = 1
" let g:deoplete#sources#ternjs#docs = 1
" let g:deoplete#sources#ternjs#filter = 0
" let g:deoplete#sources#ternjs#case_insensitive = 1
" let g:deoplete#sources#ternjs#guess = 0
" let g:deoplete#sources#ternjs#sort = 0
" let g:deoplete#sources#ternjs#expand_word_forward = 0
" let g:deoplete#sources#ternjs#omit_object_prototype = 0
" let g:deoplete#sources#ternjs#include_keywords = 1
" let g:deoplete#sources#ternjs#in_literal = 0
" let g:deoplete#sources#ternjs#filetypes = [
"             \ 'jsx',
"             \ 'javascript.jsx',
"             \ 'vue',
"             \ ]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Php
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['phpcd', 'omni']
" let g:phpcd_php_cli_executable = 'php7.3'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
