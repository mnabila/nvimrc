local adapters = require("codecompanion.adapters")

require("codecompanion").setup({
  opts = {
    send_code = false,
  },
  strategies = {
    chat = { adapter = "ollama", model = "gpt-oss:120b" },
    cmd = { adapter = "ollama", model = "gpt-oss:120b" },
    inline = {
      adapter = "ollama",
      model = "gpt-oss:120b",
      keymaps = {
        accept_change = {
          modes = { n = "<Leader>w" },
          description = "Accept the suggested change",
        },
        reject_change = {
          modes = { n = "<Leader>q" },
          description = "Reject the suggested change",
        },
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
  },
  prompt_library = {
    markdown = {
      dirs = {
        vim.fn.stdpath("config") .. "/prompts",
      },
    },
  },
})
