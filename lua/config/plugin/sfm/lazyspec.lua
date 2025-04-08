return {
  "dinhhuy258/sfm.nvim",
  dependencies = {
    "dinhhuy258/sfm-filter.nvim",
  },
  cmd = "SFMToggle",
  init = function()
    require("config.plugin.sfm.keymap")
  end,
  config = function()
    require("config.plugin.sfm.setup")
  end,
}
