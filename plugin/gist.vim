" gist-vim {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists('g:plugs["gist-vim"]')
  let g:gist_browser_command         = 'qutebrowser %URL%'
  let g:gist_clip_command            = 'xclip -selection clipboard'
  let g:gist_detect_filetype         = 1
  let g:gist_get_multiplefile        = 1
  let g:gist_open_browser_after_post = 0
  let g:gist_post_anonymous          = 0
  let g:gist_post_private            = 1
  let g:gist_show_privates           = 1
  let g:gistvim_namelength           = 32
endif
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
