local M = {}

function M.show_documentation()
    if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
    else
        vim.lsp.buf.hover()
    end
end

function M.custom_capabilities()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmp_lsp.default_capabilities(capabilities)
    return capabilities
end

function M.custom_on_init()
    vim.notify("Language Server Protocol started!", vim.log.levels.INFO)
end

function M.custom_cwd()
    if vim.loop.cwd() == vim.loop.os_homedir() then
        return vim.fn.expand("%:p:h")
    end
    return vim.loop.cwd()
end

function M.custom_on_attach(client, bufnr)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

    -- load buffer keymap
    M.keymap()
end

function M.keymap()
    local keymap = vim.keymap
    keymap.set("n", "K", M.show_documentation, { buffer = true, desc = "LSP: Show documentation" })
    keymap.set(
        "n",
        "gi",
        vim.lsp.buf.implementation,
        { buffer = true, desc = "LSP: Lists all the implementations for the symbol under the cursor in the quickfix window." }

    )
    keymap.set(
        "n",
        "ga",
        vim.lsp.buf.code_action,
        { buffer = true, desc = "LSP: Lists any LSP actions for the word under the cursor which can be triggered" }
    )
    keymap.set(
        "n",
        "gd",
        require("telescope.builtin").lsp_definitions,
        { buffer = true, desc = "LSP: Goto the definition of the word under the cursor" }
    )
    keymap.set("n", "[e", vim.diagnostic.goto_prev, { buffer = true, desc = "LSP: Goto previous diagnostic" })
    keymap.set("n", "]e", vim.diagnostic.goto_next, { buffer = true, desc = "LSP: Goto next diagnostic" })
    keymap.set(
        "n",
        "gr",
        vim.lsp.buf.rename,
        { buffer = true, desc = "LSP: Renames all references to the symbol under the cursor." }
    )
    keymap.set(
        "n",
        "gR",
        vim.lsp.buf.references,
        { buffer = true, desc = "LSP: Lists all the references to the symbol under the cursor in the quickfix window." }
    )

    -- diagnostic
    keymap.set(
        "n",
        "<leader>t",
        "<CMD>TroubleToggle document_diagnostics<CR>",
        { buffer = true, desc = "LSP: Show diagnostic from current buffer" }
    )
    keymap.set(
        "n",
        "<leader>T",
        "<CMD>TroubleToggle workspace_diagnostics<CR>",
        { buffer = true, desc = "LSP: Show diagnostic from current workspace" }
    )

    -- aerial
    -- keymap.set(
    --     "n",
    --     "<leader>A",
    --     require("aerial").toggle,
    --     { buffer = true, desc = "LSP: Open quick navigation for LSP document symbols" }
    -- )
    keymap.set(
        "n",
        "<leader>A",
        "<CMD>SymbolsOutline<CR>",
        { buffer = true, desc = "LSP: Open quick navigation for LSP document symbols" }
    )
end

function M.default(configs)
    local custom_config = {
        root_dir = M.custom_cwd,
        on_init = M.custom_on_init,
        on_attach = M.custom_on_attach,
        capabilities = M.custom_capabilities(),
    }
    if configs ~= nil then
        for key, value in pairs(configs) do
            custom_config[key] = value
        end
    end
    return custom_config
end

return M
