return {
  "dinhhuy258/sfm.nvim",
  dependencies = {
    "dinhhuy258/sfm-filter.nvim",
  },
  config = function()
    require("config.plugin.sfm.setup")
    require("config.plugin.sfm.keymap")
  end,
}
