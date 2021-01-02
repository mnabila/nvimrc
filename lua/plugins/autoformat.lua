-- bash
vim.g.formatdef_shfmt = '"shfmt -i ".(&expandtab ? shiftwidth() : "4")'
vim.g.formatters_sh = {'shfmt'}

-- lua
vim.g.formatdef_luaformatter = '"lua-format"'
vim.g.formatters_lua = {'luaformatter'}
