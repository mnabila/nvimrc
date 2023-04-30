require("go").setup({
    max_line_len = 128,
    tag_transform = "camelcase",
    tag_options = "json=omitempty",
    dap_debug = false,
    trouble = true,
    run_in_floaterm = true,
    floaterm = {
        posititon = "bottom",
        width = 0.40,
        height = 0.40,
    },
})
