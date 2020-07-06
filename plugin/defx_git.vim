if exists('g:plugs["defx-git"]')
  call defx#custom#column('git', 'column_length', 2)
  call defx#custom#column('git', 'indicators', {
        \ 'Modified'  : '✹ ',
        \ 'Staged'    : '✚ ',
        \ 'Untracked' : '✭ ',
        \ 'Renamed'   : '➜ ',
        \ 'Unmerged'  : '═ ',
        \ 'Ignored'   : '☒ ',
        \ 'Deleted'   : '✖ ',
        \ 'Unknown'   : '? '
        \ })
endif
