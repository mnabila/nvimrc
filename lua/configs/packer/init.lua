-- bootstraping
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").startup(function()
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- interface
    use({
        "feline-nvim/feline.nvim",
        config = [[require("configs.ui.feline")()]],
        after = "gruvboy.nvim",
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = [[require("configs.ui.indentline")()]],
        event = "BufRead",
    })
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = [[require("configs.ui.telescope")()]],
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        requires = "p00f/nvim-ts-rainbow",
        config = [[require("configs.ui.treesitter")()]],
    })
    use({
        "norcalli/nvim-colorizer.lua",
        config = [[require("configs.ui.colorizer")()]],
    })

    -- use mnabila/gruvboy.nvim
    use({
        "~/git/gruvboy.nvim",
        event = "VimEnter",
        config = [[vim.cmd("colorscheme gruvboy")]],
    })

    use({
        "noib3/nvim-cokeline",
        config = [[require("configs.ui.bufferline")()]],
        after = "gruvboy.nvim",
    })
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = "MunifTanjim/nui.nvim",
        keys = "`",
        config = [[require("configs.ui.filemanager")()]],
        after = "nui.nvim",
    })

    -- editor
    use({
        "lewis6991/gitsigns.nvim",
        config = [[require("configs.editor.gitsigns")()]],
    })
    use({
        "voldikss/vim-translator",
        setup = [[require("configs.editor.translator")()]],
        cmd = "Translate",
    })
    use({
        "numToStr/Comment.nvim",
        keys = { "gc", "gb", "gcc" },
        config = [[require("Comment").setup()]],
    })
    use("machakann/vim-sandwich")
    use({ "junegunn/vim-easy-align", cmd = "EasyAlign" })
    use({
        "ray-x/go.nvim",
        ft = "go",
        config = [[require("configs.languages.go")()]],
    })
    use({ "ellisonleao/glow.nvim", ft = "markdown" })
    use("nathom/filetype.nvim")

    -- autoformat for yuck file
    use({ "gpanders/nvim-parinfer", ft = "yuck" })
    use({ "elkowar/yuck.vim", ft = "yuck" })

    -- completion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
        },
        config = [[require("configs.completion.cmp")()]],
        after = "nvim-autopairs",
    })

    use({
        "windwp/nvim-autopairs",
        config = [[require("configs.completion.autopairs")()]],
    })

    use({
        "saadparwaiz1/cmp_luasnip",
        requires = "L3MON4D3/LuaSnip",
        config = [[require("configs.completion.snippet")()]],
    })

    -- lsp
    use({
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall" },
        config = [[require("configs.lsp.installer")]],
    })
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = [[require("configs.lsp")()]],
    })
    use({
        "stevearc/aerial.nvim",
        config = [[require("configs.lsp.aerial")]],
        after = "nvim-lspconfig",
    })
    use({
        "folke/trouble.nvim",
        config = [[require("configs.lsp.trouble")]],
        after = "nvim-lspconfig",
    })

    --dependencies
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- other stff
    use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
end)
