vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_filetype_exclude = {
    "NvimTree",
    "Preview",
    "__doc__",
    "dashboard",
    "dashpreview",
    "fzf",
    "help",
    "log",
    "man",
    "markdown",
    "nerdtree",
    "peekaboo",
    "sagahover",
    "startify",
    "terminal",
    "trans",
    "vista",
    "packer",
    "aerial",
}
vim.g.indent_blankline_buftype_exclude = { "terminal" }
