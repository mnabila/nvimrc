return {
  package = { url = "saghen/blink.cmp", version = "v0.*" },
  loader = { event = "InsertEnter" },
  config = function()
    require("config.plugin.blink.setup")
  end,
  deps = {
    {
      package = { url = "saghen/blink.compat" },
      deps = {
        { package = { url = "rcarriga/cmp-dap" } },
      },
    },
    { package = { url = "moyiz/blink-emoji.nvim" } },
  },
}
