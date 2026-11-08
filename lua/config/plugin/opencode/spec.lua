return {
  package = { url = "nickjvandyke/opencode.nvim" },
  loader = {
    keys = {
      { "<leader>oa", function() require("opencode").ask("@this: ") end, desc = "OpenCode: Ask", mode = { "n", "x" } },
      { "<leader>ox", function() require("opencode").select() end, desc = "OpenCode: Select", mode = { "n", "x" } },
      { "go", function() return require("opencode").operator("@this") end, desc = "OpenCode: Send range", mode = { "n", "x" }, expr = true },
      { "goo", function() return require("opencode").operator("@this") .. "_" end, desc = "OpenCode: Send line", mode = { "n", "x" }, expr = true },
    },
  },
  config = true,
}
