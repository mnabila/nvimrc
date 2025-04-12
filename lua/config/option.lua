-- Leader Key
vim.g.mapleader = " "

-- General Editing
vim.opt.autoindent = true
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard = "unnamedplus"
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10
vim.opt.autoread = true
vim.opt.bomb = false
vim.opt.formatoptions:remove("cro")

-- Display and UI
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.list = true
vim.opt.listchars = { tab = "‧‧>", space = "‧" }
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.fillchars = {
  horiz = "━",
  horizup = "┻",
  horizdown = "┳",
  vert = "┃",
  vertleft = "┫",
  vertright = "┣",
  verthoriz = "╋",
  eob = " ",
}
vim.opt.pumblend = 10
vim.opt.pumheight = 15
vim.opt.lazyredraw = true
vim.opt.linespace = 0
vim.opt.conceallevel = 0
vim.opt.errorbells = false
vim.opt.shortmess = "atToOcF"

-- Search Behavior
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.inccommand = "nosplit"

-- Command-line Completion
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.wildoptions = "pum"
vim.opt.winblend = 0

-- Window Splitting
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "screen"

-- Undo, Backup, and Swap
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup"
vim.opt.writebackup = true
vim.opt.swapfile = false

-- Performance Tweaks
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 1000
