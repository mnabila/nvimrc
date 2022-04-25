vim.cmd("packadd vim-jetpack")
vim.g["jetpack#optimization"] = 1

local jetpack = require("jetpack")
jetpack.setup({
    { "tani/vim-jetpack", opt = true },
    { "dstein64/vim-startuptime", opt = true },

    -- interface
    "kyazdani42/nvim-web-devicons",
    "feline-nvim/feline.nvim",
    "lukas-reineke/indent-blankline.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "p00f/nvim-ts-rainbow",
    "windwp/nvim-ts-autotag",
    "norcalli/nvim-colorizer.lua",
    "rktjmp/lush.nvim",
    "mnabila/gruvboy.nvim",
    "noib3/nvim-cokeline",
    "elkowar/yuck.vim",
    { "nvim-neo-tree/neo-tree.nvim", branch = "v2.x" },
    "MunifTanjim/nui.nvim",

    -- editor
    "mattn/webapi-vim",
    "mattn/gist-vim",
    "lewis6991/gitsigns.nvim",
    "mnabila/vim-header",
    "voldikss/vim-translator",
    "numToStr/Comment.nvim",
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
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    { "mattn/emmet-vim", ft = "html" },
    "windwp/nvim-autopairs",

    -- lsp
    "neovim/nvim-lspconfig",
    -- "stevearc/aerial.nvim",
    "folke/lsp-trouble.nvim",
    "jose-elias-alvarez/null-ls.nvim",
})

require("configs.editor.header")()
