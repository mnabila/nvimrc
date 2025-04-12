return {
  "NeogitOrg/neogit",
  dependencies = {
    {
      "sindrets/diffview.nvim",
      cmd = { "DiffviewOpen", "DiffviewToggleFile" },
      ft = { "NeogitStatus", "NeogitCommitView" },
    },
  },
  cmd = "Neogit",
  init = function()
    require("config.plugin.neogit.keymap")
  end,
  config = function()
    require("config.plugin.neogit.setup")
  end,
}
