vim.keymap.set("n", "`", function()
  require("snacks").explorer()
end, { desc = "File Explorer" })
