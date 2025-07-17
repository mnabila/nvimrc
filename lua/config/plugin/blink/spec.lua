return {
  package = { source = "saghen/blink.cmp", version = "v0.*" },
  loader = { event = "InsertEnter" },
  config = function()
    require("config.plugin.blink.setup")
  end,
  deps = {
    {
      package = { source = "saghen/blink.compat" },
      deps = {
        { package = { source = "rcarriga/cmp-dap" } },
      },
    },
    {
      package = { source = "fang2hou/blink-copilot" },
      deps = {
        require("config.plugin.copilot.spec"),
      },
    },
  },
}
