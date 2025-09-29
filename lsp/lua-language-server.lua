return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      telemetry = {
        enable = false,
      },
      diagnostics = {
        enable = true,
        globals = { "vim", "awesome", "use", "client", "root", "s", "screen" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("lua", true),
        preloadFileSize = 1000,
      },
    },
  },
}
