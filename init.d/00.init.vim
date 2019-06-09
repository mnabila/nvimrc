" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


au CursorHold,CursorHoldI * checktime " auto update trigger when cursor stops moving
au FocusGained,BufEnter * :checktime  " auto update trigger on buffer change or terminal focus
au BufRead /tmp/mutt-* set tw=72      " Configuring editors to work with mutt                  "

filetype on                           " required
filetype plugin indent on

set updatetime=300
set backup                               " make backup files
set backupdir=~/.local/share/nvim/backup " where to put backup files
set clipboard+=unnamedplus               " share clipboard
set directory=~/.local/share/nvim/swap   " directory to place swap files in
set gdefault                             " global substitutions are default s/a/b/g
set hidden                               " you can change buffers without saving
set mouse=a                              " Enable mouse mode
set noautoread                           " make vim monitor realtime changes to a file
set nocompatible                         " required
set noerrorbells                         " don't make noise
set ttimeoutlen=50                       " make Esc work faster
set ttyfast                              " i have a fast terminal
set undodir=~/.local/share/nvim/undo     " directory to place undo files in
set undofile                             " make undo possible after the file is closed and reopened
set wildmenu                             " turn on command line completion wild style
set wildmode=full
set showtabline=2                        " Show tabline
set guioptions-=e                        " Don't use GUI tabline
" Global Indentation
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set fileformat=unix

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto start plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" start airline
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Vim-Plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" UI plugin
Plug 'jistr/vim-nerdtree-tabs'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Utility
Plug 'Chiel92/vim-autoformat'
Plug 'KabbAmine/vCoolor.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'           " plugin provides mappings to easily delete, change and add such surroundings in pairs.
Plug 'tpope/vim-unimpaired'         " Pairs of handy bracket mappings
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'alpertuna/vim-header'

" Language pack
" Plug 'SirVer/ultisnips'             " ultimate snn for Vim
Plug 'sheerun/vim-polyglot'         " A solid language pack for Vim.
Plug 'honza/vim-snippets'           " snippets files for various programming languages

 " CSS, SCSS, SASS, LESS
" Plug 'groenewege/vim-less'
Plug 'cakebaker/scss-syntax.vim'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

" Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'

" vimL
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

" Git Support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Theme
Plug 'morhetz/gruvbox'

" Icon
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
