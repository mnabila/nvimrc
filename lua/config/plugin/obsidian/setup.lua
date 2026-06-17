local home = vim.fn.expand("$HOME")

vim.keymap.set("n", "<Leader>n", "<cmd>Obsidian<cr>")

require("obsidian").setup({
  legacy_commands = false,
  sync = {
    enabled = false,
  },
  picker = {
    name = "telescope.nvim",
  },
  note_id_func = function(title)
    local suffix = title and "-" .. title:gsub(" ", "-"):lower() or ""
    return os.time() .. suffix
  end,
  frontmatter = {
    enabled = true,
  },
  workspaces = {
    {
      name = "personal",
      path = home .. "/.obsidian/personal",
      strict = true,
    },
    {
      name = "work",
      path = home .. "/.obsidian/work",
      strict = true,
    },
  },
})
