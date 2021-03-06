local lspconfig = require('lspconfig')

local function custom_capabilittis()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    return capabilities 
end

local function custom_on_init()
    print('Language Server Protocol started!')
end

lspconfig.tsserver.setup {
    filetypes = {'javascript', 'typescript', 'typescriptreact'},
    on_init = custom_on_init,
    root_dir = function() return vim.loop.cwd() end,
    capabilities = custom_capabilittis()
}

lspconfig.sumneko_lua.setup {
    on_init = custom_on_init,
    cmd = {'lua-language-server'},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            completion = {keywordSnippet = 'Disable'},
            diagnostics = {
                enable = true,
                globals = {'vim', 'awesome', 'use'}
            },
            workspace = {
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                    ['/usr/share/lua/5.4'] = true,
                    ['/usr/share/awesome/lib'] = true
                },
            },
        }
    },
    capabilities = custom_capabilittis()
}

lspconfig.jedi_language_server.setup {
    on_init = custom_on_init,
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

lspconfig.html.setup {filetypes = {'html'}, on_init = custom_on_init,  capabilities = custom_capabilittis()}

lspconfig.cssls.setup {on_init = custom_on_init, root_dir = function() return vim.loop.cwd() end,  capabilities = custom_capabilittis() }

lspconfig.vimls.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }

lspconfig.jsonls.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }

lspconfig.bashls.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }

-- texlab not working if file or buffer is empty
lspconfig.texlab.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }

lspconfig.clangd.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }

lspconfig.dockerls.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }

lspconfig.gopls.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }

lspconfig.yamlls.setup {on_init = custom_on_init,  capabilities = custom_capabilittis() }
