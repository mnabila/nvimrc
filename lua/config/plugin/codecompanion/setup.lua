require("codecompanion").setup({
  strategies = {
    chat = { adapter = "gemini" },
    inline = { adapter = "gemini" },
  },
  adapters = {
    gemini = function()
      return require("codecompanion.adapters").extend("gemini", {
        env = {
          api_key = "cmd: pass show codecompanion/gemini",
        },
      })
    end,
  },
})
