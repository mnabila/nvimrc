local nvim_lsp = require("nvim_lsp")

nvim_lsp.tsserver.setup{
    cmd = {"typescript-language-server", "--stdio"},
    filetypes = {'javascript', 'typescript', 'typescriptreact'},
    on_attach = function(client, bufnr)
        print('tsserver started!')
    end,
}

nvim_lsp.html.setup{
    filetypes = {"html", "javascript"},
    settings = {},
    on_attach = function(client, bufnr)
        print('html-language-server started!')
    end,
}

nvim_lsp.cssls.setup{
    on_attach = function(client, bufnr)
        print('css-language-server started!')
    end,
}

nvim_lsp.sumneko_lua.setup{
    cmd = {"lua-language-server"},
    on_attach = function(client, bufnr)
        print("lua-language-server started!")
    end,
}

nvim_lsp.gopls.setup{
    cmd = {"gopls"},
    on_attach = function(client, bufnr)
        print("go-language-server started!")
    end,
}

nvim_lsp.vimls.setup{
    cmd = { "vim-language-server", "--stdio" },
    on_attach = function(client, bufnr)
        print("vim-language-server started!")
    end,
}

nvim_lsp.jsonls.setup{
    on_attach = function(client, bufnr)
        print("json-language-server started!")
    end,
}

nvim_lsp.bashls.setup{
    on_attach = function(client, bufnr)
        print("bash-language-server started!")
    end,
}

nvim_lsp.texlab.setup{
    on_attach = function(client, bufnr)
        print("texlab started!")
    end,
}

nvim_lsp.sqlls.setup{
    cmd= {"sql-language-server", "up", "--method", "stdio" },
    on_attach = function(client, bufnr)
        print("sql-language-server started!")
    end,
}
