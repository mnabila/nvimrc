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
    if title then
      return title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    end
    return tostring(os.time())
  end,
  frontmatter = {
    enabled = true,
  },
  daily_notes = {
    enabled = true,
    folder = "daily",
    date_format = "YYYY-MM-DD",
    template = "daily.md",
    default_tags = { "daily" },
  },
  templates = {
    folder = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
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
