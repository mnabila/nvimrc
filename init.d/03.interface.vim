"" User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hi  clear ModeMsg " disable Color StatusLine on Insert Mode and Visual Mode
set shortmess+=c
set completeopt=menuone,noselect,preview
set conceallevel=0                       " Text is shown normally
set cursorcolumn                         " Show vertical visual column
set cursorline                           " visually mark current line
set foldlevel=0                          " default unfold when open a file
set foldmethod=manual
set formatoptions+=l                     " adjust textwidth automatically
set hlsearch                             " highlight search matches
set ignorecase                           " ignore case
set incsearch                            " incremental search aka search as you type
set laststatus=2                         " always show the status line
set lazyredraw                           " do not redraw while running macros
set regexpengine=1
set linebreak                            " Vim to only wrap at a character in the breakat option
set linespace=0                          " don't insert any extra pixel lines between rows
set list                                 " show traling listchars
set listchars=tab:»·,trail:·,nbsp:·
set nostartofline                        " don't move the cursor to first non-blank character after some command    s (:25 e.g.)
set novisualbell                         " don't blink
set number                               " turn on line number on selected line
set relativenumber                       " turn on line numbers
set report=0                             " tell us when anything is changed
set ruler                                " always show current positions along the bottom
set scrolloff=5                          " keep 10 lines (top/bottom) for scope
set shortmess=atToO                      " shortens messages to avoid 'press a key' prompt
set showcmd                              " show the command being typed
set showmatch                            " show matching brackets
set showmode                             " show current mode
set sidescrolloff=10                     " keep 5 lines at the size
set smartcase                            " but when the query starts with upper character be case sensitive
set splitbelow                           " place other window under current window
set splitright                           " place other window right current window
set t_Co=256                             " set terminal 256 color
set wrap                                 " Vim to word wrap visually
set backspace=indent,eol,start           " Fix backspace indent

if (has('termguicolors'))
  set termguicolors
endif

"" Change cursor shape in
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=0
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

" augroup numbertoggle
"   autocmd!
"   autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
"   autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
" augroup END

"" Colorscheme configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme gruvbox
let g:gruvbox_contrast_dark     = 'dark'
let g:gruvbox_italic            = 1
let g:gruvbox_improved_strings  = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_bold              = 1

"" Icon configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1
let g:DevIconsAppendArtifactFix                       = 1
let g:DevIconsEnableFolderExtensionPatternMatching    = 1
let g:DevIconsEnableFolderPatternMatching             = 1
let g:DevIconsEnableFoldersOpenClose                  = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding            = " "
let g:WebDevIconsNerdTreeGitPluginForceVAlign         = 1
let g:WebDevIconsOS                                   = 'Linux'
let g:WebDevIconsUnicodeDecorateFolderNodes           = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth              = 1
let g:webdevicons_conceal_nerdtree_brackets           = 1
let g:webdevicons_enable                              = 1
let g:webdevicons_enable_ctrlp                        = 1
let g:webdevicons_enable_flagship_statusline          = 1
let g:webdevicons_enable_nerdtree                     = 1
let g:webdevicons_enable_startify                     = 1
let g:webdevicons_enable_unite                        = 1
let g:webdevicons_enable_vimfiler                     = 1

"" Highlight 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight ColorColumn guibg='#504945'

highlight GruvboxGreenSign guibg='#282828' guifg='#b8bb26'
highlight GruvboxRedSign guibg='#282828' guifg='#fb4934'
highlight GruvboxAquaSign guibg='#282828' guifg='#8ec07c'

highlight ALEErrorSign guibg='#e16f7e' guifg='#000000'
highlight ALEWarningSign guibg='#fdc35f' guifg='#000000'
highlight ALEInfoSign guibg='#8ca9bf' guifg='#000000'
highlight clear SignColumn

highlight! link NERDTreeFlags NERDTreeDir
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
