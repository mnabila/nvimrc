local lspconfig = require('lspconfig')

local function custom_capabilittis()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities
end

local function custom_on_init()
    print('Language Server Protocol started!')
end


local custom_on_attach = function(client)
    local aerial = require('aerial')
    aerial.on_attach(client)

    -- Aerial does not set any mappings by default, so you'll want to set some up
    local mapper = function(mode, key, result)
        vim.api.nvim_buf_set_keymap(0, mode, key, result, {noremap = true, silent = true})
    end
    -- Toggle the aerial pane with <leader>a
    mapper('n', '<leader>a', '<cmd>lua require"aerial".toggle()<CR>')
    -- Jump forwards/backwards with '[[' and ']]'
    mapper('n', '[[', '<cmd>lua require"aerial".prev_item()<CR>zvzz')
    mapper('v', '[[', '<cmd>lua require"aerial".prev_item()<CR>zvzz')
    mapper('n', ']]', '<cmd>lua require"aerial".next_item()<CR>zvzz')
    mapper('v', ']]', '<cmd>lua require"aerial".next_item()<CR>zvzz')

    -- This is a great place to set up all your other LSP mappings
end


lspconfig.tsserver.setup {
    on_init = custom_on_init,
    on_attach = custom_on_attach,
    root_dir = function() return vim.loop.cwd() end,
    capabilities = custom_capabilittis(),
    settings = {
        tsserver = {
            useBatchedBufferSync = true
        }
    }
}

lspconfig.sumneko_lua.setup {
    on_init = custom_on_init,
    on_attach = custom_on_attach,
    cmd = {'lua-language-server'},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            diagnostics = {
                enable = true,
                globals = {'vim', 'awesome', 'use'}
            },
            workspace = {
                library = {
                    ['/usr/share/nvim/runtime/lua'] = true,
                    ['/usr/share/nvim/runtime/lua/lsp'] = true,
                    ['/usr/share/awesome/lib'] = true,
                    ['/usr/share/lua/5.4/luarocks'] = true
                },
            },
        }
    },
    capabilities = custom_capabilittis()
}

lspconfig.jedi_language_server.setup {
    on_init = custom_on_init,
    on_attach = custom_on_attach,
    settings = {
        jedi = {
            enable = true,
            startupMessage = true,
            markupKindPreferred = 'markdown',
            jediSettings = {
                autoImportModules = {},
                completion = {disableSnippets = false},
                diagnostics = {enable = true, didOpen = true, didSave = true, didChange = true}
            },
            workspace = {extraPaths = {}}
        }
    },
    capabilities = custom_capabilittis()
}

lspconfig.sqls.setup {
    cmd = {'sqls', '-config', os.getenv('HOME') .. '/.config/sqls/config.yml'};
    on_init = custom_on_init,
    capabilities = custom_capabilittis(),
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true
        require('sqls').setup{ picker = 'default' }
    end
}

lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    on_init = custom_on_init,
    on_attach = custom_on_attach,
    capabilities = custom_capabilittis(),
    root_dir = function() return vim.loop.cwd() end,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    }
}


lspconfig.html.setup {on_init = custom_on_init, on_attach = custom_on_attach, capabilities = custom_capabilittis()}

lspconfig.cssls.setup {on_init = custom_on_init, on_attach = custom_on_attach,  root_dir = function() return vim.loop.cwd() end,  capabilities = custom_capabilittis() }

lspconfig.vimls.setup {on_init = custom_on_init, on_attach = custom_on_attach, capabilities = custom_capabilittis()}

lspconfig.jsonls.setup {on_init = custom_on_init, on_attach = custom_on_attach,  capabilities = custom_capabilittis() }

lspconfig.bashls.setup {on_init = custom_on_init, on_attach = custom_on_attach, capabilities = custom_capabilittis() }

-- texlab not working if file or buffer is empty
lspconfig.texlab.setup {on_init = custom_on_init, on_attach = custom_on_attach, capabilities = custom_capabilittis() }

lspconfig.clangd.setup {on_init = custom_on_init, on_attach = custom_on_attach, capabilities = custom_capabilittis() }

lspconfig.dockerls.setup {on_init = custom_on_init, on_attach = custom_on_attach, capabilities = custom_capabilittis() }

lspconfig.yamlls.setup {on_init = custom_on_init, on_attach = custom_on_attach, capabilities = custom_capabilittis() }

lspconfig.intelephense.setup {on_init = custom_on_init, on_attach = custom_on_attach, root_dir = function() return vim.loop.cwd() end,  capabilities = custom_capabilittis() }
