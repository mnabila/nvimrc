" Main {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype on                           " required
filetype plugin indent on

au CursorHold,CursorHoldI * checktime " auto update trigger when cursor stops moving
au FocusGained,BufEnter * :checktime  " auto update trigger on buffer change or terminal focus
au BufRead /tmp/mutt-* set tw=72      " Configuring editors to work with mutt                  "

if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has('termguicolors'))
  set termguicolors
endif

set backspace=indent,eol,start
set backup
set backupdir=~/.local/share/nvim/backup
set binary
set bomb
set clipboard+=unnamedplus
set completeopt=menuone,noselect,preview
set conceallevel=0
set cursorcolumn
set cursorline
set directory=~/.local/share/nvim/swap
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set foldlevel=0
set foldmethod=manual
set formatoptions+=l
set gdefault
set guioptions-=e
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set linebreak
set linespace=0
set list
set listchars=tab:»·,trail:·,nbsp:·
set mouse=a
set noautoread
set nocompatible
set noerrorbells
set nostartofline
set novisualbell
set number
set pumblend=10
set regexpengine=1
set relativenumber
set report=0
set ruler
set scrolloff=5
set shortmess=atToOc
set showcmd
set showmatch
set showmode
set showtabline=2
set sidescrolloff=10
set smartcase
set splitbelow
set splitright
set t_Co=256
set title
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set ttimeoutlen=50
set undodir=~/.local/share/nvim/undo
set undofile
set updatetime=300
set wildmenu
set wildmode=full
set wildoptions=pum
set winblend=10
set wrap
set writebackup

" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

" Global Indentation
set autoindent
set expandtab
set fileformat=unix
set pyxversion=3
set shiftwidth=2
set softtabstop=2
set tabstop=2

let g:python3_host_prog       = '/usr/bin/python3'
" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
Plug 'Yggdroot/indentLine'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

"" Utility
Plug 'Chiel92/vim-autoformat'
" Plug 'echuraev/translate-shell.vim'
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'mnabila/vim-header'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }

"" Language pack
" Plug 'Glench/Vim-Jinja2-Syntax'
" Plug 'cakebaker/scss-syntax.vim'
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
