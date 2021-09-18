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

    local aerial = require("aerial")
    aerial.on_attach(client)

    local keymap = function(mode, key, result)
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, result, { noremap = true, silent = true })
    end

    keymap("n", "K", "<CMD>lua show_documentation()<CR>")
    keymap("n", "ga", '<CMD>lua require("telescope.builtin").lsp_code_actions()<CR>')
    keymap("n", "ga", [[<CMD>'<, '>lua require("telescope.builtin").lsp_code_actions()<CR>]])
    keymap("n", "gd", '<CMD>lua require("telescope.builtin").lsp_definitions()<CR>')
    keymap("n", "[e", "<CMD>lua vim.lsp.diagnostic.goto_prev()<CR>")
    keymap("n", "]e", "<CMD>lua vim.lsp.diagnostic.goto_next()<CR>")
    keymap("n", "gr", "<CMD>lua vim.lsp.buf.rename()<CR>")

    -- aerial
    keymap("n", "<leader>a", '<CMD>lua require"aerial".toggle()<CR>')
    keymap("n", "[[", '<CMD>lua require("aerial").prev_item()<CR>zvzz')
    keymap("v", "[[", '<CMD>lua require("aerial").prev_item()<CR>zvzz')
    keymap("n", "]]", '<CMD>lua require("aerial").next_item()<CR>zvzz')
    keymap("v", "]]", '<CMD>lua require("aerial").next_item()<CR>zvzz')

    -- trouble
    keymap("n", "<leader>d", "<CMD>LspTroubleToggle<CR>")
    keymap("n", "<leader>D", "<CMD>LspTroubleWorkspaceToggle<CR>")

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        keymap("n", "<leader>f", "<CMD>lua vim.lsp.buf.formatting()<CR>")
    else
        keymap("n", "<leader>f", "<CMD>FormatWrite<CR>")
    end

    if client.resolved_capabilities.document_range_formatting then
        keymap("v", "<leader>f", "<CMD>lua vim.lsp.buf.range_formatting()<CR>")
    else
        keymap("v", "<leader>f", "<CMD>FormatWrite<CR>")
    end
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
