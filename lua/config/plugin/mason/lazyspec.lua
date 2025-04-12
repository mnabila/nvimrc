return {
  "williamboman/mason.nvim",
  event = "LspRequest",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  config = function()
    require("config.plugin.mason.setup")
  end,
}
