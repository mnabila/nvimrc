local Completion = {}

function Completion.cmp()
    return {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = require("modules.completion.cmp")(),
    }
end

function Completion.lsp()
    return {
        "neovim/nvim-lspconfig",
        config = require("modules.completion.lsp")(),
    }
end

function Completion.emmet()
    return {
        "mattn/emmet-vim",
        ft = { "javascript", "html", "css", "scss", "sass" },
    }
end

return Completion
