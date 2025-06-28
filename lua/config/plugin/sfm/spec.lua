return {
  package = { source = "dinhhuy258/sfm.nvim" },
  loader = { cmd = "SFMToggle" },
  init = function()
    require("config.plugin.sfm.keymap")
  end,
  config = function()
    require("config.plugin.sfm.setup")
  end,
  deps = {
    { package = { source = "dinhhuy258/sfm-filter.nvim" } },
  },
}
