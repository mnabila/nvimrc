require("codecompanion").setup({
  opts = {
    send_code = false,
  },
  interactions = {
    chat = {
      adapter = {
        name = "ollama",
        model = "gemma4:31b-cloud",
      },
    },
    cmd = {
      adapter = {
        name = "ollama",
        model = "gemma4:31b-cloud",
      },
    },
    inline = {
      adapter = {
        name = "ollama",
        model = "gemma4:31b-cloud",
      },
    },
  },
  adapters = {
    http = {
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
