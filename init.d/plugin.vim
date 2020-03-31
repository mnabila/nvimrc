"" Vim-Plug {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

"" UI plugin
" Plug 'mhinz/vim-startify' 
Plug 'itchyny/lightline.vim' 
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'mengelbrecht/lightline-bufferline'
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

"" Utility
Plug 'editorconfig/editorconfig-vim'
Plug 'Chiel92/vim-autoformat'
Plug 'VincentCordobes/vim-translate'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'mnabila/vim-header'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

"" Language pack
Plug 'honza/vim-snippets'
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot'

"" Git Support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" Theme
Plug 'morhetz/gruvbox'

"" Icon
Plug 'ryanoasis/vim-devicons'

"" Initialize plugin system
call plug#end()
" }}}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
