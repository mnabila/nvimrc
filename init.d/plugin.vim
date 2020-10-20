"" Vim-Plug
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'airblade/vim-gitgutter'
" Plug 'itchyny/lightline.vim' 
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'
" Plug 'mengelbrecht/lightline-bufferline'
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'ryanoasis/vim-devicons'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'Yggdroot/indentLine'
Plug 'akinsho/nvim-bufferline.lua'
Plug 'honza/vim-snippets'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'majutsushi/tagbar'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mhinz/vim-signify'
Plug 'mnabila/vim-header'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'psliwka/vim-smoothie'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'voldikss/vim-translator'

" nvim-lsp
" Plug 'neovim/nvim-lspconfig'
" Plug 'steelsojka/completion-buffers'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-lua/completion-nvim'

"" Initialize plugin system
call plug#end()
