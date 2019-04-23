" Css
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType scss,sass,css setlocal expandtab shiftwidth=2 softtabstop=2 textwidth=0

" HTML5
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType html,jinja.html setlocal expandtab shiftwidth=2 softtabstop=2 textwidth=0

" Javascript
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2
autocmd FileType jst,ezt setlocal expandtab shiftwidth=2 softtabstop=2
" autocmd FileType javascript.jsx set syntax=javascript
" au BufReadPost *.ezt,*.jst set syntax=html

" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown setlocal expandtab shiftwidth=2 softtabstop=2
let g:vim_markdown_conceal             = 0
let g:mkdp_auto_close                  = 0
let g:vim_markdown_folding_disabled    = 1
let g:vim_markdown_math                = 1
let g:vim_markdown_frontmatter         = 1
let g:vim_markdown_toml_frontmatter    = 1
let g:vim_markdown_json_frontmatter    = 1
let g:vim_markdown_fenced_languages    = ['csharp = cs']
let g:vim_markdown_auto_insert_bullets = 0

" Php
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php setlocal expandtab shiftwidth=4 softtabstop=4

" Python
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
