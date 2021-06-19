local packer = require("packer")

packer.init({
    display = {
        open_cmd = "leftabove 80vnew [packer]",
    },
    profile = {
        enable = true,
        threshold = 1,
    },
})

packer.startup(function()
    use({ "wbthomason/packer.nvim" })

    -- translate
    use({
        "voldikss/vim-translator",
        config = require("plugins.translator"),
    })

    -- smooth scroll
    use({
        "karb94/neoscroll.nvim",
        config = require("plugins.neoscroll"),
    })

    -- color preview
    use({
        "norcalli/nvim-colorizer.lua",
        config = require("plugins.colorizer"),
    })

    -- comment
    use({
        "terrortylor/nvim-comment",
        config = require("plugins.comment"),
    })

    -- autopair
    use({
        "windwp/nvim-autopairs",
        config = require("plugins.autopairs"),
    })

    -- file header
    use({
        "mnabila/vim-header",
        config = require("plugins.header"),
    })

    -- auto align
    use({ "junegunn/vim-easy-align" })

    -- surround
    use({ "machakann/vim-sandwich" })

    -- indentline
    use({
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
        config = require("plugins.indentline"),
    })

    -- file namager
    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require("plugins.nvimtree"),
    })

    -- buffer list
    use({
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require("plugins.barbar"),
    })

    -- git
    use({
        "mattn/gist-vim",
        requires = { "mattn/webapi-vim" },
        opt = true,
        config = require("plugins.gist"),
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
        config = require("plugins.gitsigns"),
    })
    use({
        "TimUntersberger/neogit",
        config = require("plugins.neogit"),
    })

    -- colorsceme
    -- note: if you want use gruvboy.nvim please change to mnabila/gruvboy.nvim
    use({
        "~/git/gruvboy.nvim",
        requires = { "rktjmp/lush.nvim" },
    })

    -- syntax highlighter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "p00f/nvim-ts-rainbow",
            "windwp/nvim-ts-autotag",
        },
        config = require("plugins.treesitter"),
    })

    -- nvim-lsp
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "glepnir/lspsaga.nvim",
            { "stevearc/aerial.nvim", config = require("plugins.aerial") },
        },
        config = require("modules.lsp"),
    })
    use({
        "hrsh7th/nvim-compe",
        requires = { "hrsh7th/vim-vsnip" },
        config = require("plugins.completion"),
    })
    use({
        "code-biscuits/nvim-biscuits",
        config = require("plugins.biscuits"),
    })
    use({
        "folke/lsp-trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- code formatter
    use({
        "lukas-reineke/format.nvim",
        config = require("plugins.formatter"),
    })

    -- snippet
    use({
        "mattn/emmet-vim",
    })

    -- sql support
    use({
        "nanotee/sqls.nvim",
    })

    -- fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        config = require("plugins.telescope"),
    })

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
        config = require("plugins.markdown"),
    })

    -- statusline
    use({
        "glepnir/galaxyline.nvim",
        branch = "main",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = require("plugins.galaxyline"),
    })

    -- benchmark
    use({
        "tweekmonster/startuptime.vim",
        opt = true,
    })
end)

return packer
