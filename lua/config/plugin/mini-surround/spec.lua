return {
  package = { url = "echasnovski/mini.surround" },
  loader = { event = "InsertEnter" },
  config = function()
    require("config.plugin.mini-surround.setup")
  end,
}
