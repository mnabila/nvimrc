set noexpandtab
set tabstop=4
set shiftwidth=4
nmap <leader>r :!go run % <CR>
packadd go.nvim
lua require("modules.editor.go")()
