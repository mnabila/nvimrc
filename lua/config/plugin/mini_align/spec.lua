return {
  package = { source = "echasnovski/mini.align" },
  loader = { event = "InsertEnter" },
  config = function()
    require("config.plugin.mini_align.setup")
  end,
}
