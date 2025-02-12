return {
  keymap = {
    preset = "none",
    ["<Tab>"] = { "select_next", "select_and_accept" },
    ["<S-Tab>"] = { "select_prev", "select_and_accept" },
    ["<CR>"] = { "select_and_accept", "fallback" },
    ["<C-space>"] = {
      function(cmp)
        cmp.show({ providers = { "lsp", "snippets" } })
      end,
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    cmdline = {},
  },

  completion = {
    accept = {
      create_undo_point = false,
      auto_brackets = {
        enabled = false,
      },
    },

    list = {
      selection = { preselect = true, auto_insert = false },
    },

    menu = {
      draw = {
        columns = { { "kind_icon", gap = 1 }, { "label", "label_description", gap = 1 }, { "source_name", gap = 1 } },
        components = {
          source_name = {
            highlight = "BlinkCmpKind",
          },
        },
      },
    },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 300,
      window = {
        border = "single",
      },
    },
  },
}
