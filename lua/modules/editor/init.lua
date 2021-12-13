local Editor = {}

function Editor.diagnostic()
    return {
        "folke/lsp-trouble.nvim",
        wants = { "nvim-web-devicons", "nvim-lspconfig" },
        config = require("modules.editor.diagnostic")(),
        disable = true,
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

function Editor.comment()
    return {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
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

function Editor.golang()
    return {
        "ray-x/go.nvim",
        config = require("modules.editor.go")(),
    }
end

return Editor
