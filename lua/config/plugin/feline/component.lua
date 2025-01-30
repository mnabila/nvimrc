return {
  vim_mode = {
    icon = "",
    provider = {
      name = "vi_mode",
      opts = {
        show_mode_name = true,
      },
    },
    hl = {
      style = "bold",
    },
    left_sep = " ",
    right_sep = " ",
  },

  git_branch = {
    provider = "git_branch",
    hl = {
      style = "bold",
    },
    left_sep = " ",
  },

  git_diff_added = {
    provider = "git_diff_added",
    icon = "+",
    left_sep = " ",
  },

  git_diff_removed = {
    provider = "git_diff_removed",
    icon = "-",
    left_sep = " ",
  },

  git_diff_changed = {
    provider = "git_diff_changed",
    icon = "~",
    left_sep = " ",
  },

  position = {
    provider = "position",
    format = "Ln {line}, Col {col}",
    right_sep = " ",
    left_sep = " ",
  },

  file_info = {
    provider = {
      name = "file_info",
      opts = {
        colored_icon = false,
        type = "relative",
      },
    },
    enabled = function()
      return vim.fn.getfsize(vim.fn.expand("%:p")) > 0
    end,
    hl = {
      style = "bold",
    },
    left_sep = " ",
    right_sep = " ",
  },

  diagnostic_errors = {
    provider = "diagnostic_errors",
    icon = " ",
    right_sep = " ",
  },

  diagnostic_hints = {
    provider = "diagnostic_hints",
    icon = " ",
    right_sep = " ",
  },

  diagnostic_info = {
    provider = "diagnostic_info",
    icon = " ",
    right_sep = " ",
  },

  diagnostic_warnings = {
    provider = "diagnostic_warnings",
    icon = " ",
    right_sep = " ",
  },
}
