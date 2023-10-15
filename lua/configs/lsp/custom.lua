local M = {}

-- Function to customize LSP (Language Server Protocol) capabilities
function M.custom_capabilities()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_lsp.default_capabilities(capabilities)
    return capabilities
end

-- Function to run custom code when LSP is initialized
function M.custom_on_init()
    vim.notify("Language Server Protocol started!", vim.log.levels.INFO)
end

-- Function to customize the current working directory
function M.custom_cwd()
    local cwd = vim.loop.cwd()
    local home_dir = vim.loop.os_homedir()
    return cwd == home_dir and vim.fn.expand("%:p:h") or cwd
end

-- Function to customize behavior when LSP is attached to a buffer
function M.custom_on_attach()
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        signs = false,
        virtual_text = { spacing = 4, prefix = "❰" },
    })

    -- Load buffer-specific keymaps
    M.keymap()
end

-- Function to define key mappings
function M.keymap()
    local keymap = vim.keymap

    local lsp_cmds = {
        hover_doc = "<CMD>Lspsaga hover_doc<CR>",
        lsp_document_symbols = require("telescope.builtin").lsp_document_symbols,
        code_action = "<CMD>Lspsaga code_action<CR>",
        goto_definition = "<CMD>Lspsaga goto_definition<CR>",
        diagnostic_jump_prev = "<CMD>Lspsaga diagnostic_jump_prev<CR>",
        diagnostic_jump_next = "<CMD>Lspsaga diagnostic_jump_next<CR>",
        rename = "<CMD>Lspsaga rename<CR>",
        trouble_toggle_doc = "<CMD>TroubleToggle document_diagnostics<CR>",
        trouble_toggle_workspace = "<CMD>TroubleToggle workspace_diagnostics<CR>",
    }

    keymap.set("n", "K", lsp_cmds.hover_doc, { buffer = true, desc = "LSP: Show documentation" })
    keymap.set("n", "<Leader>a", lsp_cmds.lsp_document_symbols, { desc = "LSP: List LSP document symbols" })
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
function M.default(configs)
    local custom_config = {
        root_dir = M.custom_cwd,
        on_init = M.custom_on_init,
        on_attach = M.custom_on_attach,
        capabilities = M.custom_capabilities(),
    }

    -- Merge custom configurations if provided
    if configs ~= nil then
        for key, value in pairs(configs) do
            custom_config[key] = value
        end
    end

    return custom_config
end

return M
