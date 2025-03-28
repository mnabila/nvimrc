return {
  "NeogitOrg/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  config = function()
    require("plugin.neogit.setup")
  end,
}
