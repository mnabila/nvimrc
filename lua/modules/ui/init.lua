local Ui = {}

function Ui.bufferline()
    return {
        "romgrk/barbar.nvim",
        wants = "nvim-web-devicons",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("modules.ui.bufferline")(),
    }
end

function Ui.statusline()
    return {
        "glepnir/galaxyline.nvim",
        wants = "nvim-web-devicons",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("modules.ui.statusline")(),
    }
end

function Ui.indentline()
    return {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        setup = function()
            require("modules.ui.indentline")()
        end,
    }
end

function Ui.filemanager()
    return {
        "kyazdani42/nvim-tree.lua",
        wants = "nvim-web-devicons",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("modules.ui.filemanager")(),
    }
end

function Ui.telescope()
    return {
        "nvim-telescope/telescope.nvim",
        wants = "nvim-web-devicons",
        requires = {
            "nvim-lua/popup.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-fzy-native.nvim",
            {
                "kyazdani42/nvim-web-devicons",
                opt = true,
            },
        },
        config = require("modules.ui.telescope")(),
    }
end

function Ui.treesitter()
    return {

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
        config = require("modules.ui.treesitter")(),
    }
end

function Ui.colorizer()
    return {
        "norcalli/nvim-colorizer.lua",
        config = require("modules.ui.colorizer")(),
    }
end

function Ui.colorscheme()
    -- note: if you want use gruvboy.nvim please change to mnabila/gruvboy.nvim
    return {
        "rktjmp/lush.nvim",
        wants = "gruvboy.nvim",
        requires = { "~/git/gruvboy.nvim", opt = true },
    }
end

return Ui
