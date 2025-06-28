return {
  package = { source = "mfussenegger/nvim-dap" },
  loader = { ft = { "go" } },
  config = function()
    require("config.plugin.dap.setup")
    require("config.plugin.dap.keymap")
  end,
  deps = {
    {
      package = { source = "igorlfs/nvim-dap-view" },
      config = true,
    },
    {
      package = { source = "leoluz/nvim-dap-go" },
      config = function()
        require("dap-go").setup()
      end,
    },
  },
}
