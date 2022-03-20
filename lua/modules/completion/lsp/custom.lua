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
    capabilities = cmp_lsp.update_capabilities(capabilities)
    return capabilities
end

function M.custom_on_init()
    print("Language Server Protocol started!")
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
    -- load aerial
    require("aerial").on_attach(client, bufnr)

    -- load buffer keymap
    M.keymap()
end

function M.keymap()
    local keymap = vim.keymap
    keymap.set("n", "K", M.show_documentation, { buffer = true })
    keymap.set("n", "ga", require("telescope.builtin").lsp_code_actions)
    -- keymap.set("n","ga", [[<CMD>'<, '>lua require("telescope.builtin").lsp_code_actions()<CR>]])
    keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { buffer = true })
    keymap.set("n", "[e", vim.lsp.diagnostic.goto_prev, { buffer = true })
    keymap.set("n", "]e", vim.lsp.diagnostic.goto_next, { buffer = true })
    keymap.set("n", "gr", vim.lsp.buf.rename, { buffer = true })
    keymap.set("n", "gR", vim.lsp.buf.references, { buffer = true })

    -- diagnostic
    keymap.set("n", "<leader>d", "<CMD>TroubleToggle document_diagnostics<CR>", { buffer = true })
    keymap.set("n", "<leader>D", "<CMD>TroubleToggle workspace_diagnostics<CR>", { buffer = true })

    -- aerial
    keymap.set("n", "<leader>a", require("aerial").toggle, { buffer = true })
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
