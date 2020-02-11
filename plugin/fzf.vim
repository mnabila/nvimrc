" fzf.vim {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["fzf.vim"]')
  let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
  " let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
  let  $FZF_DEFAULT_OPTS='--color=fg:#ebdbb2,bg:-1,hl:#d79921 --color=fg+:#282828,bg+:#d79921,hl+:#282828 --color=info:#ebdbb2,prompt:#d3869b,pointer:#282828 --color=marker:#282828,spinner:#d3869b,header:-1 --reverse --margin=1,2 --preview-window=bottom:65% --preview="bat --style=plain --color=always {}"'

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
