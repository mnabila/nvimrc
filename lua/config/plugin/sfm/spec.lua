return {
  package = { url = "dinhhuy258/sfm.nvim" },
  loader = { cmd = "SFMToggle" },
  init = function()
    require("config.plugin.sfm.keymap")
  end,
  config = function()
    require("config.plugin.sfm.setup")
  end,
  deps = {
    { package = { url = "dinhhuy258/sfm-filter.nvim" } },
  },
}
