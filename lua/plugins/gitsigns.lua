require("gitsigns").setup({
    signs = {
        add = { hl = "GitSignAdd", text = "▍" },
        change = { hl = "GitSignChange", text = "▍" },
        delete = { hl = "GitSignDelete", text = "▍" },
        topdelete = { hl = "GitSignDelete", text = "▍" },
        changedelete = { hl = "GitSignChange", text = "▍" },
    },
})
