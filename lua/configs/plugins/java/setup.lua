require("java").setup({
  java_test = {
    enable = false,
  },

  java_debug_adapter = {
    enable = true,
  },

  spring_boot_tools = {
    enable = false,
  },

  jdk = {
    auto_install = false,
  },

  notifications = {
    dap = true,
  },
})
