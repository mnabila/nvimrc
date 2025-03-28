local sfm = require("sfm").setup({
  view = {
    side = "left",
    width = 40,
    selection_render_method = "highlight",
  },
  mappings = {
    custom_only = true,
    list = {
      {
        key = "a",
        action = "create",
      },
      {
        key = "o",
        action = "edit",
      },
      {
        key = "<CR>",
        action = "edit",
      },
      {
        key = "c",
        action = "copy",
      },
      {
        key = "x",
        action = "move",
      },
      {
        key = "d",
        action = "delete",
      },
      {
        key = "]",
        action = "change_root_to_entry",
      },
      {
        key = "[",
        action = "change_root_to_parent",
      },
      {
        key = "O",
        action = "system_open",
      },
      {
        key = "<Tab>",
        action = "toggle_selection",
      },
      {
        key = "R",
        action = "reload",
      },
      {
        key = "<C-h>",
        action = "split",
      },
      {
        key = "<C-v>",
        action = "vsplit",
      },
    },
  },
})

sfm:load_extension("sfm-filter", {
  show_hidden = false,
  ignore_names = {
    "node_modules",
  },
  ignore_extensions = {
    "class",
  },
  mappings = {
    toggle_filter = { "H" },
  },
})
