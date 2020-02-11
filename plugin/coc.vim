"" coc.nvim {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["coc.nvim"]')
  let g:coc_node_path = "/usr/bin/node"
  let g:coc_filetype_map = {
        \ 'html.swig': 'html',
        \ 'jinja2.html': 'html',
        \ 'wxss': 'css',
        \ 'sass': 'css',
        \ }
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd User CocLocationsChange CocList --normal -A location
  autocmd CursorHold * silent call CocActionAsync('highlight')
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
