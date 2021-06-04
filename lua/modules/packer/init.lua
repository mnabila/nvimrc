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

    -- helper
    use({ "junegunn/vim-easy-align" })
    use({ "mnabila/vim-header" })
    use({ "windwp/nvim-autopairs" })
    use({ "terrortylor/nvim-comment" })
    use({ "rrethy/vim-hexokinase" })
    use({ "voldikss/vim-translator" })
    use({ "karb94/neoscroll.nvim" })

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
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use({ "TimUntersberger/neogit" })

    -- colorsceme
    use({ "lifepillar/vim-gruvbox8" })
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

    use({ "machakann/vim-sandwich" })
end)

return packer
