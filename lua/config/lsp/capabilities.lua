-- Ref: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/
-- Ref: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#completionClientCapabilities
return {
  textDocument = {
    semanticTokens = {
      multilineTokenSupport = true,
    },
    completion = {
      completionItem = {
        snippetSupport = true,
        commitCharactersSupport = true,
        deprecatedSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        resolveSupport = {
          properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
          },
        },
      },
    },
  },
}
