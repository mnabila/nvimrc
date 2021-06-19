autocmd FileType html,jst,ezt setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType lua setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType markdown setlocal expandtab shiftwidth=2 softtabstop=2 conceallevel=0
autocmd FileType php setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType scss,sass,css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType tex setlocal conceallevel=0
autocmd FileType vim setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType yaml setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType zsh setlocal filetype=sh
autocmd FileType javascriptreact setlocal filetype=javascript


" disable nvim-compe on telescope.nvim
augroup Compe
  autocmd!
  autocmd BufEnter * let g:compe_enabled = v:true
  autocmd FileType TelescopePrompt let g:compe_enabled = v:false
augroup END
