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
      local slug = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      return os.date("%Y-%m-%d") .. "-" .. slug
    end
    return tostring(os.time())
  end,
  frontmatter = {
    enabled = true,
  },
  note = {
    template = "default.md",
  },
  daily_notes = {
    enabled = true,
    folder = "daily",
    date_format = "YYYY-MM-DD",
    template = "daily.md",
    default_tags = { "daily" },
  },
  templates = {
    folder = ".templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M",
  },
  workspaces = {
    {
      name = "personal",
      path = home .. "/Notebook/personal",
      strict = true,
    },
    {
      name = "work",
      path = home .. "/Notebook/work",
      strict = true,
    },
  },
})
