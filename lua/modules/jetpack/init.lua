vim.cmd("packadd vim-jetpack")
vim.cmd("let g:jetpack#optimization=2")

local jetpack = require("jetpack")
jetpack.setup({
    { "tani/vim-jetpack", opt = true },
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
    "mattn/webapi-vim",
    "mattn/gist-vim",
    "lewis6991/gitsigns.nvim",
    "mnabila/vim-header",
    "voldikss/vim-translator",
    "numToStr/Comment.nvim",
    "lukas-reineke/format.nvim",
    "machakann/vim-sandwich",
    "junegunn/vim-easy-align",
    { "ray-x/go.nvim", ft = "go" },
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
    { "mattn/emmet-vim", ft = "html" },
    "windwp/nvim-autopairs",

    -- lsp
    "neovim/nvim-lspconfig",
    "stevearc/aerial.nvim",
    "folke/lsp-trouble.nvim",
})

require("modules.ui.bufferline")()
require("modules.editor.header")()
