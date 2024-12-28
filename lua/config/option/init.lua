-- Indentation
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 0
vim.opt.expandtab = true -- true = space as indentation, false = tab as indentation

-- Backup and Swap
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup"
vim.opt.writebackup = true
vim.opt.swapfile = false

-- Undo
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- Wildmenu
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.wildoptions = "pum"
vim.opt.winblend = 0

-- Cursor
vim.opt.cursorcolumn = true
vim.opt.cursorline = true

-- Window Behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- General Editing Behavior
vim.opt.autoread = true
vim.opt.backspace = "indent,eol,start"
vim.opt.bomb = false
vim.opt.clipboard = "unnamedplus"
vim.opt.compatible = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.hidden = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = "‧‧>", space = "‧" }
vim.opt.mouse = "a"
vim.opt.number = false
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 10
vim.opt.wrap = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.smartcase = true

-- UI and Visuals
vim.opt.conceallevel = 0
vim.opt.errorbells = false
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
vim.opt.laststatus = 3
vim.opt.lazyredraw = true
vim.opt.linespace = 0
vim.opt.pumblend = 10
vim.opt.pumheight = 15
vim.opt.shortmess = "atToOcF"
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 0
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.title = true

-- Performance
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 1000

-- Formatting
vim.opt.formatoptions:remove("cro")
