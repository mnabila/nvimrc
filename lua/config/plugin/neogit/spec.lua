return {
  package = { source = "NeogitOrg/neogit" },
  loader = { cmd = "Neogit" },
  config = function()
    require("config.plugin.neogit.setup")
  end,
  init = function()
    require("config.plugin.neogit.keymap")
  end,
  deps = {
    {
      package = { source = "sindrets/diffview.nvim" },
      loader = {
        cmd = { "DiffviewOpen", "DiffviewToggleFile" },
        ft = { "NeogitStatus", "NeogitCommitView" },
      },
    },
  },
}
