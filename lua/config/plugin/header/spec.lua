return {
  package = {
    url = "attilarepka/header.nvim",
    dir = "/home/saya/git/header.nvim",
    dev = false,
  },
  loader = { cmd = "AddHeader" },
  config = function()
    require("config.plugin.header.setup")
  end,
}
