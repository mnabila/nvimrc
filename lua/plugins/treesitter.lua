require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        use_languagetree = true,
    },
    indent = {
        enable = true,
    },
    rainbow = {
        enable = true,
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
        filetypes = { "html", "xml" },
    },
})
