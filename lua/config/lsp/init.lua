vim.lsp.config("*", {
  capabilities = require("config.lsp.capabilities"),
  on_attach = require("config.lsp.on_attach"),
})

vim.lsp.enable({
  "bash-language-server",
  "clangd",
  "docker-langserver",
  "emmet-language-server",
  "gopls",
  "lua-language-server",
  "pyright",
  "rust-analyzer",
  "typescript-language-server",
  "vim-language-server",
  "css-language-server",
  "json-language-server",
})

vim.diagnostic.config({
  underline = true,
  virtual_lines = {
    current_line = true,
  },
  signs = true,
})

vim.api.nvim_create_autocmd("LspDetach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client or not client.attached_buffers then
      return
    end
    for buf_id in pairs(client.attached_buffers) do
      if buf_id ~= ev.buf then
        return
      end
    end
    client:stop()
  end,
  desc = "Auto Detach LSP",
})
