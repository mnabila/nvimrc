return {
  package = { url = "williamboman/mason.nvim" },
  loader = {
    event = "BufRead",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  },
  config = function()
    require("config.plugin.mason.setup")
  end,
}
