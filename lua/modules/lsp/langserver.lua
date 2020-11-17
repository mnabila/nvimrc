local nvim_lsp = require("nvim_lsp")

local custom_on_init = function() print('Language Server Protocol started!') end

nvim_lsp.tsserver.setup {
    filetypes = {'javascript', 'typescript', 'typescriptreact'},
    on_init = custom_on_init,
    root_dir = function() return vim.loop.cwd() end
}

nvim_lsp.html.setup {filetypes = {"html"}, settings = {}, on_init = custom_on_init}

nvim_lsp.cssls.setup {on_init = custom_on_init}

nvim_lsp.sumneko_lua.setup {
    on_init = custom_on_init,
    cmd = {"lua-language-server"},
    settings = {
        Lua = {
            runtime = {version = "LuaJIT", path = vim.split(package.path, ';')},
            completion = {keywordSnippet = "Disable"},
            diagnostics = {enable = true, globals = {"vim", "awesome"}}
        }
    }
}

nvim_lsp.vimls.setup {on_init = custom_on_init}

nvim_lsp.jsonls.setup {on_init = custom_on_init}

nvim_lsp.bashls.setup {on_init = custom_on_init}

nvim_lsp.texlab.setup {on_init = custom_on_init}

nvim_lsp.clangd.setup {on_init = custom_on_init}

nvim_lsp.jedi_language_server.setup {on_init = custom_on_init}
