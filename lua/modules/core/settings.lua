vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = true
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup"
vim.opt.bg = "dark"
vim.opt.binary = true
vim.opt.bomb = true
vim.opt.clipboard = "unnamedplus"
vim.opt.compatible = false
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.conceallevel = 0
vim.opt.cursorcolumn = false
vim.opt.cursorline = true
vim.opt.encoding = "utf-8"
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"
vim.opt.fileformat = "unix"
vim.opt.fillchars = "vert:┃"
vim.opt.foldlevel = 0
vim.opt.formatoptions:remove("cro")
vim.opt.gdefault = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = "nosplit"
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = true
vim.opt.linebreak = true
vim.opt.linespace = 0
vim.opt.list = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.pumblend = 10
vim.opt.pumheight = 15
vim.opt.pyxversion = 3
vim.opt.regexpengine = 1
vim.opt.relativenumber = true
vim.opt.report = 2
vim.opt.ruler = true
vim.opt.scrolloff = 5
vim.opt.shiftwidth = 4
vim.opt.shortmess = "atToOc"
vim.opt.showcmd = false
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.sidescrolloff = 10
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.startofline = false
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.timeoutlen = 500
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.visualbell = false
vim.opt.wildmenu = true
vim.opt.wildmode = "full"
vim.opt.wildoptions = "pum"
vim.opt.winblend = 0
vim.opt.wrap = true
vim.opt.writebackup = true

vim.g.python3_host_prog = "/usr/bin/python3"

local gu = require("gruvboy.utils")
if gu.compile_is_exist() == false then
    gu.compile()
end
vim.cmd("colorscheme gruvboy_compiled")

require("utils.global").disable_distribution_plugins()
