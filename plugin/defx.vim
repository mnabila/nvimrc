if exists('g:plugs["defx.nvim"]')
  autocmd FileType defx call s:defx_my_settings()
  autocmd BufWritePost * call defx#redraw()

  call defx#custom#option('_', {
        \ 'winwidth': 30,
        \ 'split': 'vertical',
        \ 'direction': 'topleft',
        \ 'show_ignored_files': 0,
        \ 'buffer_name': 'defx',
        \ 'toggle': 1,
        \ 'columns': 'git:indent:icons:filename',
        \ 'resume': 1,
        \ 'auto_cd': 1,
        \ })
  call defx#custom#column('mark', {
        \ 'readonly_icon': '✗',
        \ 'selected_icon': '✓',
        \ })

  function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
    nnoremap <silent><buffer><expr> <2-LeftMouse> defx#do_action('open')
    nnoremap <silent><buffer><expr> <C-N> defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
    nnoremap <silent><buffer><expr> <C-l> defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
    nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'indent:icons:filename')
    nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
    nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
    nnoremap <silent><buffer><expr> N defx#do_action('new_file')
    nnoremap <silent><buffer><expr> P defx#do_action('preview')
    nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
    nnoremap <silent><buffer><expr> c defx#do_action('copy')
    nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
    nnoremap <silent><buffer><expr> d defx#do_action('remove')
    nnoremap <silent><buffer><expr> e defx#do_action('drop')
    nnoremap <silent><buffer><expr> h defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> l defx#is_directory() ?  defx#do_action('open_directory') : defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> m defx#do_action('move')
    nnoremap <silent><buffer><expr> o defx#do_action('open_tree', 'toggle')
    nnoremap <silent><buffer><expr> p defx#do_action('paste')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> r defx#do_action('rename')
    nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yp defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  endfunction
endif
