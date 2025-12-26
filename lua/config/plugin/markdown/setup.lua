require("render-markdown").setup({
  file_types = { "markdown", "codecompanion" },
  overrides = {
    filetype = {
      codecompanion = {
        render_modes = { "n", "c", "v" },
      },
    },
  },
})
