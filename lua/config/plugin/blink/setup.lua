require("blink-cmp").setup({
  keymap = {
    preset = "none",
    ["<Tab>"] = { "select_next" },
    ["<S-Tab>"] = { "select_prev" },
    ["<CR>"] = { "select_and_accept", "fallback" },
    ["<C-space>"] = {
      function(cmp)
        cmp.show({ providers = { "lsp", "path", "buffer" } })
      end,
    },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  cmdline = {
    enabled = false,
  },

  term = {
    enabled = false,
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
        treesitter = { "lsp" },
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
})
