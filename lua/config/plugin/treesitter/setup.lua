require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "lua",
    "markdown",
    "vim",
  },
  auto_install = false,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
})
