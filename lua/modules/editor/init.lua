local Editor = {}

function Editor.aerial()
    return {
        "stevearc/aerial.nvim",
        wants = { "nvim-lspconfig" },
        config = require("modules.editor.aerial")(),
    }
end

function Editor.diagnostic()
    return {
        "folke/lsp-trouble.nvim",
        wants = { "nvim-web-devicons", "nvim-lspconfig" },
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = require("modules.editor.diagnostic")(),
    }
end

function Editor.gist()
    return {
        "mattn/gist-vim",
        wants = "webapi-vim",
        requires = { "mattn/webapi-vim", opt = true },
        cmd = "Gist",
        config = require("modules.editor.gist")(),
    }
end

function Editor.gitsigns()
    return {
        "lewis6991/gitsigns.nvim",
        wants = "plenary.nvim",
        requires = { "nvim-lua/plenary.nvim", opt = true },
        config = require("modules.editor.gitsigns")(),
    }
end

function Editor.header()
    return {
        "mnabila/vim-header",
        cmd = "AddMITLicense",
        config = require("modules.editor.header")(),
    }
end

function Editor.translator()
    return {
        "voldikss/vim-translator",
        config = require("modules.editor.translator")(),
    }
end

function Editor.autopair()
    return {
        "windwp/nvim-autopairs",
        config = require("modules.editor.autopairs")(),
    }
end

function Editor.comment()
    return {
        "terrortylor/nvim-comment",
        event = "BufRead",
        config = function()
            require("modules.editor.comment")()
        end,
    }
end

function Editor.formatter()
    return {
        "lukas-reineke/format.nvim",
        config = require("modules.editor.formatter")(),
    }
end

function Editor.markdown()
    return {
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
        config = require("modules.editor.markdown")(),
    }
end

function Editor.sql()
    return {
        "nanotee/sqls.nvim",
        ft = "sql",
    }
end

function Editor.surround()
    return {
        "machakann/vim-sandwich",
        keys = { "sa", "sr", "sd" },
    }
end

function Editor.easyalign()
    return { "junegunn/vim-easy-align", cmd = "EasyAlign" }
end

return Editor
