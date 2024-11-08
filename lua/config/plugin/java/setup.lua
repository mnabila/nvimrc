require("java").setup({
  java_test = {
    enable = true,
  },

  java_debug_adapter = {
    enable = true,
  },

  spring_boot_tools = {
    enable = true,
  },

  jdk = {
    auto_install = false,
  },

  notifications = {
    dap = true,
  },
})
