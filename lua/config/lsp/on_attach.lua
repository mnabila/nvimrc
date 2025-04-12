local keymap = vim.keymap
local lsp = vim.lsp
local command = vim.api.nvim_create_user_command

return function(client, bufnr)
  if client:supports_method("textDocument/hover") or client:supports_method("textDocument/signatureHelp") then
    keymap.set("n", "K", function()
      lsp.buf.hover({
        silent = true,
        border = "single",
        width = math.floor(vim.o.columns / 2),
      })
    end, { buffer = true, desc = "LSP: Show Documentation" })
  end

  -- if client:supports_method("textDocument/inlayHint") then
  --   lsp.inlay_hint.enable(true, { bufnr = bufnr })
  --
  --   command("InlayHint", function()
  --     lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled({ bufnr = bufnr }))
  --   end, { nargs = 0 })
  -- end

  -- if client:supports_method("textDocument/formatting") then
  --   keymap.set("n", "<leader>f", function()
  --     lsp.buf.format({ async = true })
  --   end, { desc = "LSP: Formats the current buffer" })
  -- end

  if client:supports_method("textDocument/definition") then
    keymap.set("n", "grd", lsp.buf.definition, { buffer = true, desc = "LSP: Go to definition" })
  end

  if not client:is_stopped() then
    command("LspStop", function()
      client:stop({ force = true })
      vim.notify(client.name:upper() .. " already stopped")
    end, { nargs = 0 })
  end
end
