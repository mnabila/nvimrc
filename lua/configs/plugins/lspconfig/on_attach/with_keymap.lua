local Keymap = {}

Keymap.attach = function()
  local keymap = vim.keymap

  keymap.set("n", "K", "<CMD>Lspsaga hover_doc<CR>", { buffer = true, desc = "LSP: Show documentation" })
  keymap.set("n", "ga", "<CMD>Lspsaga code_action<CR>", { buffer = true, desc = "LSP: List LSP actions" })
  keymap.set("n", "gd", "<CMD>Lspsaga goto_definition<CR>", { buffer = true, desc = "LSP: Goto definition" })
  keymap.set("n", "gR", "<CMD>Lspsaga rename<CR>", { buffer = true, desc = "LSP: Rename references" })
  keymap.set(
    "n",
    "[e",
    "<CMD>Lspsaga diagnostic_jump_prev<CR>",
    { buffer = true, desc = "LSP: Goto previous diagnostic" }
  )
  keymap.set("n", "]e", "<CMD>Lspsaga diagnostic_jump_next<CR>", { buffer = true, desc = "LSP: Goto next diagnostic" })
  keymap.set(
    "n",
    "<leader>t",
    "<CMD>Trouble diagnostics<CR>",
    { buffer = true, desc = "LSP: Show workspace diagnostics" }
  )
end

return Keymap
