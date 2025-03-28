return {
  "dinhhuy258/sfm.nvim",
  dependencies = {
    "dinhhuy258/sfm-filter.nvim",
  },
  config = function()
    require("plugin.sfm.setup")
    require("plugin.sfm.keymap")
  end,
}
