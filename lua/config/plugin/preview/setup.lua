require("preview").setup({
  previewers_by_ft = {
    plantuml = {
      name = "plantuml_svg",
      renderer = { type = "command", opts = { cmd = { "feh" } } },
    },
  },
  previewers = {
    plantuml_svg = {
      args = { "-pipe", "-tpng" },
    },
  },
})
