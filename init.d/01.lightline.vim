"" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \   'colorscheme': 'gruvbox',
      \   'active': {
      \     'left':[ [ 'mode', 'paste' ],
      \              [ 'fugitive' ],
      \              [ 'readonly', 'absolutepath', 'modified' ], ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'filetype' ],
      \              [ 'currentfunction', 'cocstatus', 'fileformat', 'fileencoding' ], ],
      \   },
      \   'tabline': {
      \     'left': [ [ 'buffers' ], ],
      \     'right': [ [ 'username' ], ],
      \   },
      \   'component': {
      \     'lineinfo': ' %l/%-L',
      \     'username': 'Nabil',
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
      \     'fugitive': 'LightlineFugitive',
      \     'modified': 'LightlineModified',
      \     'readonly': 'LightlineReadonly',
      \   },
      \   'separator':{
      \     'left': '', 'right': ''
      \   },
      \   'subseparator':{
      \     'left': '', 'right': ''
      \   },
      \}

let g:lightline#bufferline#enable_devicons   = 1
let g:lightline#bufferline#filename_modifier = ":t"
let g:lightline#bufferline#modified          = " +"
let g:lightline#bufferline#more_buffers      = "..."
let g:lightline#bufferline#read_only         = " -"
let g:lightline#bufferline#shorten_path      = 0
let g:lightline#bufferline#show_number       = 0
let g:lightline#bufferline#unnamed           = "[NO NAME]"

function! LightlineModified()
  return &modified ? '●' : ''
endfunction

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

