local Utils = {}

-- Function to customize LSP (Language Server Protocol) capabilities
Utils.custom_capabilities = function()
	local ok, cmp = pcall(require, "cmp_nvim_lsp")
	if not ok then
		return nil
	end
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = cmp.default_capabilities(capabilities)
	return capabilities
end

-- Function to customize the current working directory
Utils.custom_cwd = function()
	local cwd = vim.loop.cwd()
	local home_dir = vim.loop.os_homedir()
	return cwd == home_dir and vim.fn.expand("%:p:h") or cwd
end

-- Function to customize behavior when LSP is attached to a buffer
Utils.custom_on_attach = function()
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		signs = false,
		virtual_text = { spacing = 2, prefix = "❰" },
	})

	-- Load buffer-specific keymaps
	Utils.keymap()
end

-- Function to define key mappings
Utils.keymap = function()
	local keymap = vim.keymap

	local lsp_cmds = {
		hover_doc = "<CMD>Lspsaga hover_doc<CR>",
		code_action = "<CMD>Lspsaga code_action<CR>",
		goto_definition = "<CMD>Lspsaga goto_definition<CR>",
		diagnostic_jump_prev = "<CMD>Lspsaga diagnostic_jump_prev<CR>",
		diagnostic_jump_next = "<CMD>Lspsaga diagnostic_jump_next<CR>",
		rename = "<CMD>Lspsaga rename<CR>",
		trouble_toggle_doc = "<CMD>TroubleToggle document_diagnostics<CR>",
		trouble_toggle_workspace = "<CMD>TroubleToggle workspace_diagnostics<CR>",
	}

	keymap.set("n", "K", lsp_cmds.hover_doc, { buffer = true, desc = "LSP: Show documentation" })
	keymap.set("n", "ga", lsp_cmds.code_action, { buffer = true, desc = "LSP: List LSP actions" })
	keymap.set("n", "gd", lsp_cmds.goto_definition, { buffer = true, desc = "LSP: Goto definition" })
	keymap.set("n", "[e", lsp_cmds.diagnostic_jump_prev, { buffer = true, desc = "LSP: Goto previous diagnostic" })
	keymap.set("n", "]e", lsp_cmds.diagnostic_jump_next, { buffer = true, desc = "LSP: Goto next diagnostic" })
	keymap.set("n", "gR", lsp_cmds.rename, { buffer = true, desc = "LSP: Rename references" })
	keymap.set(
		"n",
		"<leader>t",
		lsp_cmds.trouble_toggle_doc,
		{ buffer = true, desc = "LSP: Show document diagnostics" }
	)
	keymap.set(
		"n",
		"<leader>T",
		lsp_cmds.trouble_toggle_workspace,
		{ buffer = true, desc = "LSP: Show workspace diagnostics" }
	)
end

-- Function to create a default LSP configuration
Utils.default = function(configs)
	local custom_config = {
		root_dir = Utils.custom_cwd,
		on_attach = Utils.custom_on_attach,
		capabilities = Utils.custom_capabilities(),
	}

	-- Utilserge custom configurations if provided
	if configs ~= nil then
		for key, value in pairs(configs) do
			custom_config[key] = value
		end
	end

	return custom_config
end

return Utils
