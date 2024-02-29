-- Ref: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/
local M = vim.lsp.protocol.make_client_capabilities()

-- Ref: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#completionClientCapabilities
M.textDocument.completion.completionItem.snippetSupport = true
M.textDocument.completion.completionItem.commitCharactersSupport = true
M.textDocument.completion.completionItem.deprecatedSupport = true
M.textDocument.completion.completionItem.preselectSupport = true
M.textDocument.completion.completionItem.insertReplaceSupport = true
M.textDocument.completion.completionItem.labelDetailsSupport = true
M.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

return M
