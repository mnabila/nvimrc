return {
  package = { url = "nvim-telescope/telescope.nvim" },
  loader = { cmd = "Telescope" },
  init = function()
    require("config.plugin.telescope.keymap")
  end,
  config = function()
    require("config.plugin.telescope.setup")
  end,
  deps = {
    { package = { url = "nvim-lua/plenary.nvim" } },
    { package = { url = "natecraddock/telescope-zf-native.nvim" } },
    { package = { url = "nvim-telescope/telescope-ui-select.nvim" } },
  },
}
