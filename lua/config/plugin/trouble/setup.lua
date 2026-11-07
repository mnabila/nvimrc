require("trouble").setup({
  auto_preview = false,
  auto_jump = false,
  focus = true,
})

-- Integrate with snacks.nvim to use snacks picker for trouble symbols/diagnostics
require("snacks").setup({
  picker = {
    actions = require("trouble.sources.snacks").actions,
  },
})
