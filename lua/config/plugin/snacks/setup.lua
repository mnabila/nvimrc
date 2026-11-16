require("snacks").setup({
  -- startup / perf
  bigfile = { enabled = true },
  quickfile = { enabled = true },

  -- editor
  scope = { enabled = true },
  input = { enabled = true },

  -- ui
  notifier = { enabled = true },
  indent = {
    enabled = true,
    animate = { enabled = false }, -- cheaper on big files
  },
  terminal = { enabled = true },

  -- file explorer (replaces sfm)
  explorer = { enabled = true, replace_netrw = true },

  picker = {
    enabled = true,

    -- cheaper scoring on large candidate lists
    matcher = { frecency = false },

    sources = {
      -- no preview for these only, so explorer layout stays default
      files = { layout = { preset = "select" } },
      grep = { layout = { preset = "select" } },

      explorer = {
        hidden = false,
        ignored = false,
        git_status = false,
        git_status_open = false,
        diagnostics = false,
        diagnostics_open = false,
        focus = "list", -- start in the file list, not the input
        layout = {
          preset = "sidebar",
          hidden = { "input" }, -- hide the search box
        },
        exclude = { "node_modules", "target", "*.class" },
        win = {
          list = {
            keys = {
              ["["] = "explorer_up", -- goto parent dir
              ["]"] = "explorer_focus", -- goto child dir (set root)
              ["o"] = "confirm", -- open file / folder
              ["O"] = "explorer_open", -- system open
            },
          },
        },
      },
    },
  },

  -- disabled (handled by other plugins or unused)
  scroll = { enabled = false },
})
