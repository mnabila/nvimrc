if exists('g:plugs["vim-autoformat"]')
  " Shell
  let g:formatdef_shfmt = '"shfmt -i ".(&expandtab ? shiftwidth() : "4")'
  let g:formatters_sh   = ['shfmt']
endif
