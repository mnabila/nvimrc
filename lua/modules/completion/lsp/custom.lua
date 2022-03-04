local M = {}

function _G.show_documentation()
    if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
    else
        vim.cmd("lua vim.lsp.buf.hover()")
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
    local key = require("utils.keymap")
    key.bufmap("K", "<CMD>lua show_documentation()<CR>")
    key.bufmap("ga", '<CMD>lua require("telescope.builtin").lsp_code_actions()<CR>')
    key.bufmap("ga", [[<CMD>'<, '>lua require("telescope.builtin").lsp_code_actions()<CR>]])
    key.bufmap("gd", '<CMD>lua require("telescope.builtin").lsp_definitions()<CR>')
    key.bufmap("[e", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>")
    key.bufmap("]e", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>")
    key.bufmap("gr", "<CMD>lua vim.lsp.buf.rename()<CR>")
    key.bufmap("gR", "<CMD>lua vim.lsp.buf.references()<CR>")

    -- diagnostic
    key.bufmap("<leader>d", "<CMD>TroubleToggle document_diagnostics<CR>")
    key.bufmap("<leader>D", "<CMD>TroubleToggle workspace_diagnostics<CR>")

    -- aerial
    key.bufmap("<leader>a", '<CMD>lua require"aerial".toggle()<CR>')
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
