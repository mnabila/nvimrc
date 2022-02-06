local lc = require("utils.packer").loadConfig
local Completion = {}

function Completion.cmp()
    return {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-emoji",
            {
                "hrsh7th/cmp-path",
                commit = "d83839a",
            },
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
        },
        config = lc(require("modules.completion.cmp")),
    }
end

function Completion.lsp()
    return {
        "neovim/nvim-lspconfig",
        config = lc(require("modules.completion.lsp")),
    }
end

function Completion.emmet()
    return {
        "mattn/emmet-vim",
        ft = { "javascript", "html", "css", "scss", "sass" },
    }
end

function Completion.autopair()
    return {
        "windwp/nvim-autopairs",
        config = lc(require("modules.completion.autopairs")),
    }
end

function Completion.copilot()
    return {
        "github/copilot.vim",
        required = {
            "hrsh7th/cmp-copilot",
        },
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
            vim.g.copilot_tab_fallback = ""
        end,
        ft = { "python", "go", "javascript", "bash", "lua" },
        disable = true,
    }
end

return Completion
