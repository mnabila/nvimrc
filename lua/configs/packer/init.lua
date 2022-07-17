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
        config = function()
            if _G.InstallMode ~= true then
                require("configs.ui.feline")()
            end
        end,
        event = "VimEnter",
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.ui.indentline")()
            end
        end,
        event = "BufRead",
    })
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            "nvim-telescope/telescope-ui-select.nvim",
        },
        config = function()
            if _G.InstallMode ~= true then
                require("configs.ui.telescope")()
            end
        end,
    })
    use({
        "nvim-treesitter/nvim-treesitter",
        requires = "p00f/nvim-ts-rainbow",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.ui.telescope")()
            end
        end,
    })
    use({
        "norcalli/nvim-colorizer.lua",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.ui.colorizer")()
            end
        end,
    })
    use({
        "rktjmp/lush.nvim",
        requires = "~/git/gruvboy.nvim",
        config = function()
            if _G.InstallMode ~= true then
                vim.cmd("colorscheme gruvboy")
            end
        end,
    })

    use({
        "noib3/nvim-cokeline",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.ui.bufferline")()
            end
        end,
    })
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = "MunifTanjim/nui.nvim",
        keys = "`",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.ui.filemanager")()
            end
        end,
        after = "nui.nvim",
    })

    -- editor
    use({
        "mattn/gist-vim",
        requires = "mattn/webapi-vim",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.editor.gist")()
            end
        end,
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.editor.gitsigns")()
            end
        end,
    })
    use({
        "voldikss/vim-translator",
        config = function()
            if _G.InstallMode ~= true then
                require("configs.editor.translator")()
            end
        end,
        cmd = "Translate",
    })
    use({
        "numToStr/Comment.nvim",
        keys = { "gc", "gb", "gcc" },
        config = function()
            if _G.InstallMode ~= true then
                require("Comment").setup()
            end
        end,
    })
    use("machakann/vim-sandwich")
    use({ "junegunn/vim-easy-align", cmd = "EasyAlign" })
    use({ "ray-x/go.nvim", ft = "go" })
    use({ "ellisonleao/glow.nvim", ft = "markdown" })
    use("nathom/filetype.nvim")
    use("gpanders/nvim-parinfer")
    use({ "elkowar/yuck.vim", ft = "yuck" })

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
            if _G.InstallMode ~= true then
                require("configs.completion.snippet")()
                require("configs.completion.cmp")()
                require("configs.completion.autopairs")()
            end
        end,
    })

    -- lsp
    use({
        "neovim/nvim-lspconfig",
        requires = {
            "folke/trouble.nvim",
        },
        config = function()
            if _G.InstallMode ~= true then
                require("configs.completion.lsp")()
            end
        end,
    })
    use("jose-elias-alvarez/null-ls.nvim")
    use("stevearc/aerial.nvim")

    --dependencies
    use("kyazdani42/nvim-web-devicons")
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")

    -- other stff
    use("nvim-treesitter/playground")

    use({ "dstein64/vim-startuptime", cmd = "StartupTime" })
end)
