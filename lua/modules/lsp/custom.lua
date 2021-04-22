local M = {}

function _G.show_documentation()
    if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.cmd("h " .. vim.fn.expand("<cword>"))
    else
        vim.cmd('lua require("lspsaga.hover").render_hover_doc()')
    end
end

function M.custom_capabilities()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = { properties = { "additionalTextEdits" } }
    return capabilities
end

function M.custom_on_init()
    print("Language Server Protocol started!")
end

function M.custom_on_attach(client, bufnr)
    local aerial = require("aerial")
    aerial.on_attach(client)

    local keymap = function(mode, key, result)
        vim.api.nvim_buf_set_keymap(bufnr, mode, key, result, { noremap = true, silent = true })
    end

    keymap("n", "K", "<CMD>lua show_documentation()<CR>")
    keymap("n", "<C-j>", '<CMD>lua require("lspsaga.hover").smart_scroll_hover(1)<CR>')
    keymap("n", "<C-k>", '<CMD>lua require("lspsaga.hover").smart_scroll_hover(-1)<CR>')
    keymap("n", "ga", '<CMD>lua require("lspsaga.codeaction").code_action()<CR>')
    keymap("v", "ga", "<CMD>'<, '>lua require(\"lspsaga.codeaction\").code_action()<CR>")
    keymap("n", "gd", '<CMD>lua require("lspsaga.provider").preview_definition()<CR>')
    keymap("n", "[e", '<CMD>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
    keymap("n", "]e", '<CMD>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')
    keymap("n", "gr", '<CMD>lua require("lspsaga.rename").rename()<CR>')
    keymap("n", "<leader>a", '<CMD>lua require"aerial".toggle()<CR>')
    keymap("n", "[[", '<CMD>lua require("aerial").prev_item()<CR>zvzz')
    keymap("v", "[[", '<CMD>lua require("aerial").prev_item()<CR>zvzz')
    keymap("n", "]]", '<CMD>lua require("aerial").next_item()<CR>zvzz')
    keymap("v", "]]", '<CMD>lua require("aerial").next_item()<CR>zvzz')
    keymap("n", "<leader>F", "<CMD>FormatWrite<CR>")

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
