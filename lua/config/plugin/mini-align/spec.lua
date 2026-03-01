return {
  package = { url = "echasnovski/mini.align" },
  loader = { event = "InsertEnter" },
  config = function()
    require("config.plugin.mini-align.setup")
  end,
}
