return {
  package = { url = "coder/claudecode.nvim" },
  loader = {
    cmd = {
      "ClaudeCode",
      "ClaudeCodeFocus",
      "ClaudeCodeSelectModel",
      "ClaudeCodeAdd",
      "ClaudeCodeSend",
    },
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Claude Code: Toggle terminal" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code: Focus terminal" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Claude Code: Add current buffer to context" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Claude Code: Send selection" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Claude Code: Select model" },
    },
  },
  config = true,
  deps = {
    {
      package = { url = "folke/snacks.nvim" },
      config = true,
    },
  },
}
