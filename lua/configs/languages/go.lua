require("go").setup({
    max_line_len = 128,
    tag_transform = "snakecase",
    tag_options = "json=omitempty",
    dap_debug = false,
    trouble = true,
})
