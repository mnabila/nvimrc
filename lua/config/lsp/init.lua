local capabilities = require("config.lsp.capabilities")

vim.lsp.config("*", {
  capabilities = capabilities,
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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)

    if not client then
      return
    end

    -- Hover documentation
    if client:supports_method("textDocument/hover") or client:supports_method("textDocument/signatureHelp") then
      vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover({
          silent = true,
          border = "single",
          max_width = math.floor(vim.o.columns / 2),
        })
      end, { buffer = ev.buf, noremap = true, desc = "LSP: Show Documentation" })
    end

    -- Formatting
    if client:supports_method("textDocument/formatting") then
      vim.keymap.set("n", "<leader>f", function()
        vim.lsp.buf.format({ async = true })
      end, { buffer = ev.buf, noremap = true, desc = "LSP: Formats the current buffer" })
    end

    -- Go to definition
    if client:supports_method("textDocument/definition") then
      vim.keymap.set(
        "n",
        "gd",
        vim.lsp.buf.definition,
        { buffer = ev.buf, noremap = true, desc = "LSP: Go to definition" }
      )
    end

    -- Inlay hints
    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

      vim.api.nvim_buf_create_user_command(ev.buf, "InlayHintToggle", function()
        local current_state = vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf })
        vim.lsp.inlay_hint.enable(not current_state, { bufnr = ev.buf })
      end, { desc = "Toggle inlay hints" })
    end

    vim.api.nvim_buf_create_user_command(ev.buf, "LspStop", function()
      if client:is_stopped() then
        vim.notify(client.name:upper() .. " is already stopped", vim.log.levels.WARN)
      else
        client:stop(true)
        vim.notify(client.name:upper() .. " stopped", vim.log.levels.INFO)
      end
    end, { desc = "Stop LSP client for this buffer" })
  end,
  desc = "User custom event for LspAttach",
})
