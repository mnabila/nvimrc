" buffer {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" buffer cleanup - delete every buffer except the one open
function! buffer#List()
  redir => bufnames
  silent ls
  redir END
  let list = []
  for i in split(bufnames, "\n")
    let buf = split(i, '"' )
    call add(list, buf[-2])
  endfor
  return list
endfunction

function! buffer#DeleteOnly()
  let list = filter(buffer#List(), 'v:val != bufname("%")')
  for buffer in list
    call buffer#DeleteEmptyBuffers()
    exec "bdelete ".buffer
  endfor
endfunction

function! buffer#DeleteEmptyBuffers()
  let buffers = filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
  if !empty(buffers)
    exe 'bd '.join(buffers, ' ')
  endif
endfunction
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
