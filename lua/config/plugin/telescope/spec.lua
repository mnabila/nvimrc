return {
  package = { source = "nvim-telescope/telescope.nvim" },
  loader = { cmd = "Telescope" },
  init = function()
    require("config.plugin.telescope.keymap")
  end,
  config = function()
    require("config.plugin.telescope.setup")
  end,
  deps = {
    { package = { source = "nvim-lua/plenary.nvim" } },
    { package = { source = "natecraddock/telescope-zf-native.nvim" } },
    { package = { source = "nvim-telescope/telescope-ui-select.nvim" } },
  },
}
