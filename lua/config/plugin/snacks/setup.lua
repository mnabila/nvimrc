require("snacks").setup({
  -- startup / perf
  bigfile = { enabled = true },
  quickfile = { enabled = true },

  -- editor
  scope = { enabled = true },
  input = { enabled = true },

  -- ui
  notifier = { enabled = true },
  indent = { enabled = true },

  -- file explorer (replaces sfm)
  explorer = { enabled = true, replace_netrw = true },
  picker = {
    enabled = true,
    sources = {
      explorer = {
        hidden = false,
        ignored = false,
        git_status = false,
        git_status_open = false,
        diagnostics = false,
        diagnostics_open = false,
        exclude = {
          "node_modules",
          "target",
          "*.class",
        },
        layout = {
          preset = "sidebar",
          preview = false,
          layout = {
            box = "vertical",
            width = 40,
            min_width = 40,
            height = 0,
            position = "left",
            border = "none",
            { win = "list", border = "none" },
          },
        },
        win = {
          list = {
            keys = {
              ["["] = "explorer_up",    -- goto parent dir
              ["]"] = "explorer_focus", -- goto child dir (set root)
              ["o"] = "confirm",        -- open file / folder
              ["O"] = "explorer_open",  -- system open
            },
          },
        },
      },
    },
  },

  -- disabled (handled by other plugins or unused)
  scroll = { enabled = false },
})
