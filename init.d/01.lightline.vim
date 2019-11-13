"" lightline {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["lightline.vim"]')
  let g:lightline = {
        \   'colorscheme': 'gruvbox',
        \   'active': {
        \     'left':[ [ 'mode', 'paste' ],
        \              [ 'gitbranch' ],
        \              [ 'readonly', 'fname', 'modified' ], ],
        \     'right': [ [ 'lineinfo' ],
        \              [ 'filetype' ],
        \              [ 'currentfunction', 'cocstatus', 'fileformat', 'fileencoding' ], ],
        \   },
        \   'inactive': {
        \    'left': [ [ 'fname' ], ],
        \   'right': [ [ 'lineinfo' ], ],
        \   },
        \   'tabline': {
        \     'left': [ [ 'buffers' ], ],
        \     'right': [ [ 'username' ], ],
        \   },
        \   'component': {
        \     'lineinfo': '%3p%%  %l/%-L',
        \     'username': $USER,
        \     'fname': '%<%f',
        \   },
        \   'component_expand': {
        \     'buffers': 'lightline#bufferline#buffers',
        \   },
        \   'component_type': {
        \     'buffers': 'tabsel',
        \   },
        \   'component_function': {
        \     'bufferinfo': 'lightline#buffer#bufferinfo',
        \     'cocstatus': 'coc#status',
        \     'currentfunction': 'CocCurrentFunction',
        \     'gitbranch': 'LightlineFugitive',
        \     'modified': 'LightlineModified',
        \     'readonly': 'LightlineReadonly',
        \     'filetype': 'MyFiletype',
        \     'fileformat': 'MyFileformat',
        \   },
        \   'separator':{
        \     'left': '', 'right': ''
        \   },
        \   'subseparator':{
        \     'left': '', 'right': ''
        \   },
        \}

  let g:lightline#bufferline#enable_devicons   = 1
  let g:lightline#bufferline#filename_modifier = ':t'
  let g:lightline#bufferline#shorten_path      = 0
  let g:lightline#bufferline#show_number       = 0
  let g:lightline#bufferline#unicode_symbols   = 1
  let g:lightline#bufferline#unnamed           = 'NO NAME'

  function! LightlineModified()
    return &modified ? '●' : ''
  endfunction

  function! LightlineReadonly()
    return &readonly ? '' : ''
  endfunction

  " function! LightlineFugitive()
  "   if exists('*fugitive#head')
  "     let branch = fugitive#head()
  "     return branch !=# '' ? ' '.branch : ''
  "   endif
  "   return ''
  " endfunction

  function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
  endfunction

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction
endif
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

