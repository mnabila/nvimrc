local packer = require("packer")
local use = packer.use

packer.startup(function()
    -- package manager
    use({ "wbthomason/packer.nvim" })

    -- translate
    use({
        "voldikss/vim-translator",
        event = "BufEnter",
        config = require("plugins.translator").config(),
    })

    -- smooth scroll
    use({
        "karb94/neoscroll.nvim",
        config = require("plugins.neoscroll").config(),
    })

    -- color preview
    use({
        "norcalli/nvim-colorizer.lua",
        cmd = { "ColorizerToggle" },
        config = require("plugins.colorizer").config(),
    })

    -- comment
    use({
        "terrortylor/nvim-comment",
        config = require("plugins.comment").config(),
    })

    -- autopair
    use({
        "windwp/nvim-autopairs",
        config = require("plugins.autopairs").config(),
    })

    -- file header
    use({
        "mnabila/vim-header",
        event = "BufRead",
        config = require("plugins.header").config(),
    })

    -- auto align
    use({ "junegunn/vim-easy-align", event = "BufEnter" })

    -- surround
    use({ "machakann/vim-sandwich", event = "BufEnter" })

    -- indentline
    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "BufEnter",
        config = require("plugins.indentline").config(),
    })

    -- file namager
    use({
        "kyazdani42/nvim-tree.lua",
        event = "VimEnter",
        wants = "nvim-web-devicons",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("plugins.nvimtree").config(),
    })

    -- buffer list
    use({
        "romgrk/barbar.nvim",
        event = "VimEnter",
        wants = "nvim-web-devicons",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("plugins.barbar").config(),
    })

    -- git
    use({
        "mattn/gist-vim",
        wants = "webapi-vim",
        requires = { "mattn/webapi-vim", opt = true },
        cmd = "Gist",
        config = require("plugins.gist").config(),
    })
    use({
        "lewis6991/gitsigns.nvim",
        wants = "plenary.nvim",
        requires = { "nvim-lua/plenary.nvim", opt = true },
        config = require("plugins.gitsigns").config(),
    })

    -- colorsceme
    -- note: if you want use gruvboy.nvim please change to mnabila/gruvboy.nvim
    use({
        "rktjmp/lush.nvim",
        wants = "gruvboy.nvim",
        requires = { "~/git/gruvboy.nvim", opt = true },
    })

    -- syntax highlighter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        wants = {
            "nvim-ts-rainbow",
            "nvim-ts-autotag",
        },
        requires = {
            { "p00f/nvim-ts-rainbow", opt = true },
            { "windwp/nvim-ts-autotag", opt = true },
        },
        config = require("plugins.treesitter").config(),
    })

    -- nvim-lsp
    use({
        "neovim/nvim-lspconfig",
        requires = {
            {
                "stevearc/aerial.nvim",
                config = require("plugins.aerial").config(),
            },
            {
                "code-biscuits/nvim-biscuits",
                config = require("plugins.biscuits").config(),
            },
            {
                "folke/lsp-trouble.nvim",
                wants = "nvim-web-devicons",
                requires = { "kyazdani42/nvim-web-devicons", opt = true },
                config = require("plugins.trouble").config(),
            },
        },
        config = require("modules.lsp").config(),
    })
    use({
        "hrsh7th/nvim-compe",
        wants = "vim-vsnip",
        requires = { "hrsh7th/vim-vsnip", opt = true },
        config = require("plugins.completion").config,
    })

    -- code formatter
    use({
        "lukas-reineke/format.nvim",
        -- event = "BufRead",
        config = require("plugins.formatter").config(),
    })

    -- snippet
    use({
        "mattn/emmet-vim",
        ft = { "javascript", "html", "css", "scss", "sass" },
    })

    -- sql support
    use({
        "nanotee/sqls.nvim",
        ft = "sql",
    })

    -- fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            "kyazdani42/nvim-web-devicons",
        },
        config = require("plugins.telescope").config(),
    })

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
        config = require("plugins.markdown").config(),
    })

    -- statusline
    use({
        "glepnir/galaxyline.nvim",
        wants = "nvim-web-devicons",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("plugins.galaxyline").config(),
    })

    -- benchmark
    use({
        "tweekmonster/startuptime.vim",
        cmd = "StartupTime",
    })
end)

return packer
