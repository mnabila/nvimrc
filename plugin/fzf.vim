" fzf.vim {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["fzf.vim"]')
  let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
  let  $FZF_DEFAULT_OPTS='--reverse --margin=1,1 --preview-window=bottom:65% --preview="bat --style=plain --color=always {}"'

  let g:fzf_colors = {
        \ 'fg':      ['bg', 'StatusLine'],
        \ 'bg':      ['fg', 'StatusLine'],
        \ 'hl':      ['fg', 'Search'],
        \ 'fg+':     ['bg', 'Search', 'StatusLine', 'StatusLine'],
        \ 'bg+':     ['fg', 'Search', 'Search'],
        \ 'hl+':     ['bg', 'Search'],
        \ 'info':    ['fg', 'PreProc'],
        \ 'border':  ['fg', 'Normal'],
        \ 'prompt':  ['fg', 'Search'],
        \ 'pointer': ['fg', 'Search'],
        \ 'marker':  ['fg', 'StatusLine'],
        \ 'spinner': ['fg', 'Label'],
        \ 'header':  ['fg', 'Comment']
        \ }

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }

  function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = float2nr(40)
    let width = float2nr(150)
    let horizontal = float2nr((&columns - width) / 2)
    let vertical = 5

    let opts = {
          \ 'relative': 'editor',
          \ 'row': vertical,
          \ 'col': horizontal,
          \ 'width': width,
          \ 'height': height,
          \ 'style': 'minimal'
          \ }

    call nvim_open_win(buf, v:true, opts)
  endfunction
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
