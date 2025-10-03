return {
  package = {
    url = "attilarepka/header.nvim",
    dir = "/home/saya/git/header.nvim",
    dev = true,
  },
  loader = { cmd = "AddHeader" },
  config = function()
    require("config.plugin.header.setup")
  end,
}
