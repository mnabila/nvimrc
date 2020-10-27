vim.g.fzf_layout = {window = {width = 0.9, height = 0.8, highlight = 'Normal', rounded = false}}
vim.cmd([[
autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>
command! -bang -nargs=? -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({"options": ["--info=inline"]}), <bang>0)
]])
