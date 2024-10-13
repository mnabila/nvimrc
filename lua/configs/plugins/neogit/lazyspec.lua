return {
  "NeogitOrg/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  config = function()
    require("configs.plugins.neogit.setup")
  end,
}
