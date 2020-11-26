autocmd FileType jst setlocal filetype=html
autocmd FileType html,jst,ezt setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType json syntax match Comment +\/\/.\+$+
autocmd FileType lua setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType markdown setlocal expandtab shiftwidth=2 softtabstop=2 colorcolumn=90  conceallevel=0
autocmd FileType php setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 colorcolumn=80
autocmd FileType scss,sass,css setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType tex setlocal conceallevel=0
autocmd FileType vim setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType * setlocal formatoptions-=cro 
