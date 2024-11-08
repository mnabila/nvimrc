return {
  "NeogitOrg/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  config = function()
    require("config.plugin.neogit.setup")
  end,
}
