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
    { "nvim-lua/plenary.nvim", lazy = true },

    -- colorscheme
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("configs.interfaces.colorscheme")
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
                        typescriptreact = { "typescriptreact" },
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
            "nvimtools/none-ls.nvim",
            {
                "folke/trouble.nvim",
                config = function()
                    require("configs.lsp.trouble")
                end,
            },
            {
                "nvimdev/lspsaga.nvim",
                config = function()
                    require("configs.lsp.saga")
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
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = { "MunifTanjim/nui.nvim" },
        keys = "`",
        config = function()
            require("configs.editor.filemanager")
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = true,
    },
    {
        "machakann/vim-sandwich",
        event = "InsertEnter",
    },
    { "junegunn/vim-easy-align", cmd = "EasyAlign" },
    {
        "sindrets/diffview.nvim",
        config = true,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-ui-select.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
        },
        config = function()
            require("configs.editor.telescope")
        end,
    },

    -- interfaces
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("configs.interfaces.statusline")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("configs.interfaces.treesitter")
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        cmd = { "ColorizerToggle" },
        config = function()
            require("configs.interfaces.colorizer")
        end,
    },

    -- languages
    {
        "ray-x/go.nvim",
        dependencies = { "ray-x/guihua.lua" },
        ft = { "go", "gomod" },
        config = function()
            require("configs.languages.go")
        end,
    },
}

require("lazy").setup(plugins, {
    ui = {
        border = "single",
    },
})
