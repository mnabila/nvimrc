if exists('g:plugs["lightline.vim"]')
  let g:lightline = {
        \  'colorscheme': 'gruvbox',
        \  'active': {
        \    'left':[ [ 'mode', 'paste' ],
        \             [ 'gitstatus' ],
        \             [ 'readonly', 'fname', 'modified' ], ],
        \    'right': [ [ 'lineinfo' ],
        \             [ 'filetype' ],
        \             [ 'currentfunction', 'cocstatus', 'fileformat', 'fileencoding' ], ],
        \  },
        \  'inactive': {
        \   'left': [ [ 'fname' ], ],
        \   'right': [ [ 'lineinfo' ], ],
        \  },
        \  'tab': {
        \    'active': ['tabnum'],
        \    'inactive': ['tabnum'],
        \  },
        \  'tabline': {
        \    'left': [ [ 'buffers' ], ],
        \    'right': [ ['username'], ['smarttabs'] ],
        \  },
        \  'component': {
        \    'lineinfo': '%3p%%  %l/%-L',
        \    'username': $USER,
        \    'fname': '%<%f',
        \  },
        \  'component_expand': {
        \    'buffers': 'lightline#bufferline#buffers',
        \    'smarttabs': 'SmartTabsIndicator',
        \  },
        \  'component_type': {
        \    'buffers': 'tabsel',
        \  },
        \  'component_function': {
        \    'bufferinfo': 'lightline#buffer#bufferinfo',
        \    'cocstatus': 'coc#status',
        \    'currentfunction': 'CocCurrentFunction',
        \    'gitstatus': 'GitStatus',
        \    'modified': 'LightlineModified',
        \    'readonly': 'LightlineReadonly',
        \    'filetype': 'MyFiletype',
        \    'fileformat': 'MyFileformat',
        \  },
        \  'separator':{
        \    'left': '', 'right': ''
        \  },
        \  'subseparator':{
        \    'left': '', 'right': ''
        \  },
        \ }

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

  function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
  endfunction

  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

  function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    let l:branch = fugitive#head()
    if l:branch == ""
      return ''
    else
      return printf('+%d ~%d -%d |  %s', a, m, r, l:branch)
    endif
  endfunction

  function! SmartTabsIndicator()
    let tabs = lightline#tab#tabnum(tabpagenr())
    let tab_total = tabpagenr('$')
    return tabpagenr('$') > 1 ? ('TABS ' . tabs . '/' . tab_total) : ''
  endfunction
endif
