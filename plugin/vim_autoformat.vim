if exists('g:plugs["vim-autoformat"]')
  " bash
  let g:formatdef_shfmt = '"shfmt -i ".(&expandtab ? shiftwidth() : "4")'
  let g:formatters_sh   = ['shfmt']

  " lua
  let g:formatdef_luaformatter = '"lua-format"'
  let g:formatters_lua         = ['luaformatter']
endif
