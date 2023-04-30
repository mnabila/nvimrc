local command = vim.api.nvim_create_user_command

command("TSPrintNode", function()
    vim.notify(require("nvim-treesitter.ts_utils").get_node_at_cursor():type())
end, { nargs = 0 })
