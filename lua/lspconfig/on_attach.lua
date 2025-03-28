return function(client, bufnr)
  if client:supports_method("textDocument/hover") or client:supports_method("textDocument/signatureHelp") then
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({
        border = "single",
        width = math.floor(vim.o.columns / 2),
      })
    end, { noremap = true, buffer = true, desc = "LSP: Show Documentation" })
  end

  if client:supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end

  if client:supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "LSP: Formats the current buffer" })
  end
end
