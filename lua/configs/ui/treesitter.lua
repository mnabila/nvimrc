local options = {
    ensure_installed = {
        "go",
        "gomod",
        "json",
        "lua",
        "markdown",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "yaml",
    },
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
        disable = { "python" },
    },
    -- windwp/nvim-autopairs
    autopairs = {
        enable = true,
    },
    playground = {
        enable = true,
        updatetime = 25,
        persist_queries = false,
    },
}

require("nvim-treesitter.configs").setup(options)
