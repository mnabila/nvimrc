local lspconfig = require('lspconfig')

local function custom_on_init()
    print('Language Server Protocol started!')
end

lspconfig.tsserver.setup {
    filetypes = {'javascript', 'typescript', 'typescriptreact'},
    on_init = custom_on_init,
    root_dir = function() return vim.loop.cwd() end
}

lspconfig.sumneko_lua.setup {
    on_init = custom_on_init,
    cmd = {'lua-language-server'},
    settings = {
        Lua = {
            runtime = {version = 'LuaJIT', path = vim.split(package.path, ';')},
            completion = {keywordSnippet = 'Disable'},
            diagnostics = {enable = true, globals = {'vim', 'awesome', 'use'}}
        }
    }
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
    }
}

lspconfig.html.setup {filetypes = {'html'}, on_init = custom_on_init}

lspconfig.cssls.setup {on_init = custom_on_init, root_dir = function() return vim.loop.cwd() end}

lspconfig.vimls.setup {on_init = custom_on_init}

lspconfig.jsonls.setup {on_init = custom_on_init}

lspconfig.bashls.setup {on_init = custom_on_init}

lspconfig.texlab.setup {on_init = custom_on_init}

lspconfig.clangd.setup {on_init = custom_on_init}

-- texlab not working if file or buffer is empty
lspconfig.texlab.setup {on_init = custom_on_init, filetypes = {'tex', 'bib', 'plaintex'}}

