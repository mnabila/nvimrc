local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- dependencies
    { "nvim-tree/nvim-web-devicons", lazy = true },

    -- colorschem
    {
        dir = "~/git/gruvboy.nvim", -- use mnabila/gruvboy.nvim
        priority = 1000,
        config = function()
            vim.cmd("colorscheme gruvboy")
        end,
    },

    -- completions
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            {
                "hrsh7th/cmp-vsnip",
                dependencies = "hrsh7th/vim-vsnip",
                init = function()
                    vim.g.vsnip_snippet_dir = vim.fn.stdpath("config") .. "/snippets"
                    vim.g.vsnip_filetypes = {
                        typescriptreact = { "typescriptreact", "tailwindcss" },
                    }
                end,
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("configs.completion.autopairs")
                end,
            },
        },
        config = function()
            require("configs.completion.cmp")
        end,
    },

    -- languages server protocol
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "jose-elias-alvarez/null-ls.nvim",
            {
                "folke/trouble.nvim",
                config = function()
                    require("configs.lsp.trouble")
                end,
            },
        },
        config = function()
            require("configs.lsp")
        end,
    },

    -- editor
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("configs.editor.gitsigns")
        end,
    },
    {
        "voldikss/vim-translator",
        cmd = "Translate",
        init = function()
            require("configs.editor.translator")
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },
    {
        "machakann/vim-sandwich",
        event = "InsertEnter",
    },
    { "junegunn/vim-easy-align",     cmd = "EasyAlign" },
    {
        "ray-x/go.nvim",
        dependencies = { "ray-x/guihua.lua" },
        ft = { "go", "gomod" },
        config = function()
            require("configs.languages.go")
        end,
    },
    {
        "rebelot/heirline.nvim",
        dependencies = {
            {
                "SmiteshP/nvim-navic",
                config = function()
                    require("nvim-navic").setup({
                        depth_limit = 4,
                        separator = " ❱ ",
                    })
                end,
            },
        },
        config = function()
            require("configs.ui.heirline")
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        config = function()
            require("configs.ui.telescope")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        dependencies = { "p00f/nvim-ts-rainbow" },
        config = function()
            require("configs.ui.treesitter")
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = { "MunifTanjim/nui.nvim" },
        keys = "`",
        config = function()
            require("configs.ui.filemanager")
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        cmd = { "ColorizerToggle" },
        config = function()
            require("configs.ui.colorizer")
        end,
    },
}

require("lazy").setup(plugins, {
    ui = {
        border = "single",
    },
})
