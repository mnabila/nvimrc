return {
  keymap = {
    ["<S-Tab>"] = { "select_prev", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<CR>"] = { "accept", "fallback" },
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
    list = {
      selection = "preselect",
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
