vim.cmd("packadd vim-jetpack")

local jetpack = require("jetpack")
jetpack.setup({
    { "tani/vim-jetpack", opt = 1 },
    { "dstein64/vim-startuptime", opt = true },

    -- interface
    "kyazdani42/nvim-web-devicons",
    "romgrk/barbar.nvim",
    "NTBBloodbath/galaxyline.nvim",
    "lukas-reineke/indent-blankline.nvim",
    { "kyazdani42/nvim-tree.lua", commit = "99d65af" },
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
    "windwp/nvim-ts-autotag",
    "norcalli/nvim-colorizer.lua",
    "rktjmp/lush.nvim",
    "mnabila/gruvboy.nvim",

    -- editor
    "stevearc/aerial.nvim",
    "folke/lsp-trouble.nvim",
    "mattn/gist-vim",
    "mattn/webapi-vim",
    "lewis6991/gitsigns.nvim",
    "mnabila/vim-header",
    "voldikss/vim-translator",
    "numToStr/Comment.nvim",
    "lukas-reineke/format.nvim",
    "machakann/vim-sandwich",
    "junegunn/vim-easy-align",
    "ray-x/go.nvim",
    { "ellisonleao/glow.nvim", ft = "markdown" },
    "nathom/filetype.nvim",

    -- completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/vim-vsnip",
    "neovim/nvim-lspconfig",
    "mattn/emmet-vim",
    "windwp/nvim-autopairs",

    { "dstein64/vim-startuptime", opt = true },
})

require("modules.ui.colorscheme")()
require("modules.ui.bufferline")()
require("modules.ui.statusline")()
require("modules.ui.filemanager")()
require("modules.ui.indentline")()
require("modules.ui.telescope")()
require("modules.ui.treesitter")()
require("modules.ui.colorizer")()

require("modules.editor.formatter")()
require("modules.editor.gist")()
require("modules.editor.gitsigns")()
require("modules.editor.go")()
require("modules.editor.header")()
require("modules.editor.translator")()
require("Comment").setup()

require("modules.completion.lsp")()
require("modules.completion.cmp")()
require("modules.completion.autopairs")()
