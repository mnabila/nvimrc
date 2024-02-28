return function()
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		signs = false,
		virtual_text = { spacing = 2, prefix = "❰" },
	})

	require("configs.plugins.lspconfig.on_attach.with_keymap").attach()
end
