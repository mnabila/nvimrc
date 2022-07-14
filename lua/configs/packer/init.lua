return require("packer").startup(function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- interface
    use({
        "feline-nvim/feline.nvim",
        config = function()
            require("configs.ui.feline")()
        end,
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("configs.ui.indentline")()
        end,
    })
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            require("configs.ui.telescope")()
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        requires = "p00f/nvim-ts-rainbow",
        config = function()
            require("configs.ui.telescope")()
        end,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("configs.ui.colorizer")()
        end,
    })
    use({ "rktjmp/lush.nvim", requires = "~/git/gruvboy.nvim" })

    use({
        "noib3/nvim-cokeline",
        config = function()
            require("configs.ui.bufferline")()
        end,
    })
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        config = function()
            require("configs.ui.filemanager")()
        end,
    })

    -- editor
    use({
        "mattn/gist-vim",
        requires = "mattn/webapi-vim",
        config = function()
            require("configs.editor.gist")()
        end,
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.editor.gitsigns")()
        end,
    })
    use({
        "voldikss/vim-translator",
        config = function()
            require("configs.editor.translator")()
        end,
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })
    use("machakann/vim-sandwich")
    use("junegunn/vim-easy-align")
    use({ "ray-x/go.nvim", ft = "go" })
    use({ "ellisonleao/glow.nvim", ft = "markdown" })
    use("nathom/filetype.nvim")
    use("gpanders/nvim-parinfer")
    use("elkowar/yuck.vim")

    -- completion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "windwp/nvim-autopairs",
        },
        config = function()
            require("configs.completion.snippet")()
            require("configs.completion.cmp")()
            require("configs.completion.autopairs")()
        end,
    })

    -- lsp
    use({
        "neovim/nvim-lspconfig",
        config = function()
            require("configs.completion.lsp")()
        end,
    })
    use("folke/lsp-trouble.nvim")
    use("jose-elias-alvarez/null-ls.nvim")
    use("stevearc/aerial.nvim")

    -- debugger
    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")

    --dependencies
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use("MunifTanjim/nui.nvim")

    -- other stff
    use("nvim-treesitter/playground")

    use({ "dstein64/vim-startuptime", opt = true })
end)
