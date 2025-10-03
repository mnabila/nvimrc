return {
  package = { url = "mfussenegger/nvim-dap" },
  loader = { ft = { "go" } },
  config = function()
    require("config.plugin.dap.setup")
    require("config.plugin.dap.keymap")
  end,
  deps = {
    {
      package = { url = "igorlfs/nvim-dap-view" },
      config = true,
    },
    {
      package = { url = "leoluz/nvim-dap-go" },
      config = function()
        require("dap-go").setup()
      end,
    },
  },
}
