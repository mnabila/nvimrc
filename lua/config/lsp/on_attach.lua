local keymap = vim.keymap
local lsp = vim.lsp
local command = vim.api.nvim_create_user_command

return function(client, bufnr)
  -- Hover documentation
  if client.supports_method("textDocument/hover") or client.supports_method("textDocument/signatureHelp") then
    keymap.set("n", "K", function()
      lsp.buf.hover({
        silent = true,
        border = "single",
        -- Fix: Use max_width instead of width
        max_width = math.floor(vim.o.columns / 2),
      })
    end, { buffer = bufnr, desc = "LSP: Show Documentation" })
  end

  -- Inlay hints
  if client.supports_method("textDocument/inlayHint") then
    lsp.inlay_hint.enable(true, { bufnr = bufnr })

    -- Fix: Make command buffer-local to avoid conflicts
    vim.api.nvim_buf_create_user_command(bufnr, "InlayHintToggle", function()
      local current_state = lsp.inlay_hint.is_enabled({ bufnr = bufnr })
      lsp.inlay_hint.enable(not current_state, { bufnr = bufnr })
    end, { desc = "Toggle inlay hints" })
  end

  -- Formatting
  if client.supports_method("textDocument/formatting") then
    keymap.set("n", "<leader>f", function()
      lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = "LSP: Formats the current buffer" })
  end

  -- Go to definition
  if client.supports_method("textDocument/definition") then
    keymap.set("n", "grd", lsp.buf.definition, { buffer = bufnr, desc = "LSP: Go to definition" })
  end

  vim.api.nvim_buf_create_user_command(bufnr, "LspStop", function()
    if client:is_stopped() then
      vim.notify(client.name:upper() .. " is already stopped", vim.log.levels.WARN)
    else
      client:stop(true)
      vim.notify(client.name:upper() .. " stopped", vim.log.levels.INFO)
    end
  end, { desc = "Stop LSP client for this buffer" })
end
