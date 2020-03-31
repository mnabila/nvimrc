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
  let g:coc_global_extensions=[
        \ 'coc-css',
        \ 'coc-emmet',
        \ 'coc-go',
        \ 'coc-highlight',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-marketplace',
        \ 'coc-phpls',
        \ 'coc-prettier',
        \ 'coc-python',
        \ 'coc-sh',
        \ 'coc-snippets',
        \ 'coc-tsserver',
        \ 'coc-vetur',
        \ 'coc-vimlsp',
        \ 'coc-word',
        \ 'coc-xml',
        \ 'coc-texlab',
        \ 'coc-yaml'
        \ ]
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  autocmd User CocLocationsChange CocList --normal -A location
  autocmd CursorHold * silent call CocActionAsync('highlight')
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
