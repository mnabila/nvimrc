local Keymap = {}

local next_diagnostic = function()
  vim.diagnostic.jump({ count = 1 })
end

local prev_diagnostic = function()
  vim.diagnostic.jump({ count = -11 })
end

Keymap.attach = function()
  local keymap = vim.keymap

  -- LSP Mappings
  keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = "LSP: Show documentation" })
  keymap.set("n", "ga", vim.lsp.buf.code_action, { buffer = true, desc = "LSP: List LSP actions" })
  keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = "LSP: Goto definition" })
  keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true, desc = "LSP: Goto implementation" })
  keymap.set("n", "gr", vim.lsp.buf.references, { buffer = true, desc = "LSP: Goto reference" })
  keymap.set("n", "grr", vim.lsp.buf.rename, { buffer = true, desc = "LSP: Rename" })

  -- Diagnostic navigation mappings
  keymap.set("n", "[e", next_diagnostic, { buffer = true, desc = "LSP: Goto previous diagnostic" })
  keymap.set("n", "]e", prev_diagnostic, { buffer = true, desc = "LSP: Goto next diagnostic" })
end

return Keymap
