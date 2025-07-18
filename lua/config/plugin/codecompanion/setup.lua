local adapters = require("codecompanion.adapters")

require("codecompanion").setup({
  strategies = {
    chat = { adapter = "copilot" },
    inline = { adapter = "copilot" },
  },
  prompt_library = {
    ["Swaggo"] = {
      strategy = "inline",
      description = "Generate Swagger documentation annotation from endpoint handler function",
      prompts = {
        {
          role = "system",
          content = "You are an expert in generating Swagger (OpenAPI) documentation using swaggo for generationg swagger documentation, especially for REST APIs written in Go. Your output should be in the form of Go-style Swagger annotations as comments above the handler function. Do not wrap the code in markdown.",
        },
        {
          role = "user",
          content = "<user_prompt> Generate Swagger documentation for this handler function. Return only the Go Swagger annotations with godoc witout function body or markdown. </user_prompt>",
        },
      },
    },
  },
})
