local adapters = require("codecompanion.adapters")

require("codecompanion").setup({
  opts = {
    send_code = false,
  },
  interactions = {
    chat = { adapter = "claude_code" },
    cmd = { adapter = "claude_code" },
    inline = {
      adapter = {
        name = "ollama",
        model = "qwen3.5:397b-cloud",
      },
    },
  },
  adapters = {
    http = {
      gemini = function()
        return adapters.extend("gemini", {
          env = {
            api_key = "cmd: pass show codecompanion/gemini",
            model = "gemini-2.5-pro",
          },
        })
      end,
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = "https://ollama.com",
            api_key = "cmd: pass show codecompanion/ollama",
          },
          headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer ${api_key}",
          },
          parameters = {
            sync = true,
          },
        })
      end,
    },
    acp = {
      claude_code = function()
        return require("codecompanion.adapters").extend("claude_code", {
          env = {
            CLAUDE_CODE_OAUTH_TOKEN = "cmd: pass show codecompanion/claude",
          },
        })
      end,
    },
  },
  prompt_library = {
    markdown = {
      dirs = {
        vim.fn.stdpath("config") .. "/prompts",
      },
    },
  },
})
