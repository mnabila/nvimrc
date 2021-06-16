vim.cmd("packadd packer.nvim")

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
    use({ "wbthomason/packer.nvim", opt = true })

    -- translate
    use({ "voldikss/vim-translator" })

    -- smooth scroll
    use({ "karb94/neoscroll.nvim" })

    -- color preview
    use({ "rrethy/vim-hexokinase" })

    -- comment
    use({ "terrortylor/nvim-comment" })

    -- autopair
    use({ "windwp/nvim-autopairs" })

    -- file header
    use({ "mnabila/vim-header" })

    -- auto align
    use({ "junegunn/vim-easy-align" })

    -- surround
    use({ "machakann/vim-sandwich" })

    -- indentline
    use({
        "lukas-reineke/indent-blankline.nvim",
        branch = "lua",
    })

    -- file namager
    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- buffer list
    use({
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- git
    use({
        "mattn/gist-vim",
        requires = { "mattn/webapi-vim" },
        opt = true,
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use({ "TimUntersberger/neogit" })

    -- colorsceme
    use("rktjmp/lush.nvim")
    use("~/git/gruvboy.nvim") -- note: if you want use gruvboy.nvim please change to mnabila/gruvboy.nvim
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        requires = {
            "p00f/nvim-ts-rainbow",
            "windwp/nvim-ts-autotag",
        },
    })

    -- nvim-lsp
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "glepnir/lspsaga.nvim",
            "stevearc/aerial.nvim",
        },
    })
    use({
        "hrsh7th/nvim-compe",
        requires = { "hrsh7th/vim-vsnip" },
    })
    use({ "code-biscuits/nvim-biscuits" })
    use({
        "folke/lsp-trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- code formatter
    use({ "lukas-reineke/format.nvim" })

    -- snippet
    use({ "mattn/emmet-vim" })

    -- sql support
    use({ "nanotee/sqls.nvim" })

    -- fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
    })

    -- mardown
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
    })

    -- statusline
    use({
        "glepnir/galaxyline.nvim",
        branch = "main",
        requires = { "kyazdani42/nvim-web-devicons" },
    })

    -- benchmark
    use({
        "tweekmonster/startuptime.vim",
        opt = true,
    })
end)

return packer
