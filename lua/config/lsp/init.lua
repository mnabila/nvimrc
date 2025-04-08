vim.lsp.config("*", {
  capabilities = require("config.lsp.capabilities"),
  on_attach = require("config.lsp.on_attach"),
})

vim.lsp.enable({
  "bashls",
  "cssls",
  "dockerls",
  "emmetls",
  "gopls",
  "luals",
  "tsls",
  "vimls",
  "pyright",
})

vim.diagnostic.config({
  underline = true,
  virtual_lines = {
    current_line = true,
  },
  signs = true,
})

vim.api.nvim_create_autocmd("LspDetach", {
  group = vim.api.nvim_create_augroup("LspStopWithLastClient", {}),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client or not client.attached_buffers then
      return
    end
    for buf_id in pairs(client.attached_buffers) do
      if buf_id ~= args.buf then
        return
      end
    end
    client:stop()
  end,
  desc = "Auto detach LSP",
})
