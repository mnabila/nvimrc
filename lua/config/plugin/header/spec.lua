return {
  package = { source = "attilarepka/header.nvim" },
  loader = { cmd = "AddHeader" },
  config = function()
    require("config.plugin.header.setup")
  end,
}
