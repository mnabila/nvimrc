local lspconfig = require("lspconfig")
local c = require("modules.lsp.custom")

lspconfig.tsserver.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities(),
    root_dir = vim.loop.cwd,
    settings = {
        tsserver = {
            useBatchedBufferSync = true,
        },
        javascript = {
            autoClosingTags = true,
            suggest = {
                autoImports = true,
            },
        },
    },
})

lspconfig.sumneko_lua.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities(),
    cmd = { "lua-language-server" },
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            diagnostics = {
                enable = true,
                globals = { "vim", "awesome", "use" },
            },
            workspace = {
                library = {
                    ["/usr/share/nvim/runtime/lua"] = true,
                    ["/usr/share/nvim/runtime/lua/lsp"] = true,
                    ["/usr/share/awesome/lib"] = true,
                    ["/usr/share/lua/5.4/luarocks"] = true,
                },
            },
        },
    },
})

lspconfig.jedi_language_server.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    settings = {
        jedi = {
            enable = true,
            startupMessage = true,
            markupKindPreferred = "markdown",
            jediSettings = {
                autoImportModules = {},
                completion = { disableSnippets = false },
                diagnostics = { enable = true, didOpen = true, didSave = true, didChange = true },
            },
            workspace = { extraPaths = {} },
        },
    },
    capabilities = c.custom_capabilities(),
})

lspconfig.sqls.setup({
    cmd = { "sqls", "-config", os.getenv("HOME") .. "/.config/sqls/config.yml" },
    on_init = c.custom_on_init,
    capabilities = c.custom_capabilities(),
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true
        require("sqls").setup({ picker = "default" })
    end,
})

lspconfig.gopls.setup({
    cmd = { "gopls", "serve" },
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities(),
    root_dir = vim.loop.cwd,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
})

lspconfig.html.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities(),
})

lspconfig.cssls.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities(),
    root_dir = vim.loop.cwd,
})

lspconfig.vimls.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities()
})

lspconfig.jsonls.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities()
})

lspconfig.bashls.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities()
})

-- texlab not working if file or buffer is empty
lspconfig.texlab.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities()
})

lspconfig.clangd.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities()
})

lspconfig.dockerls.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities()
})

lspconfig.yamlls.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities()
})

lspconfig.intelephense.setup({
    on_init = c.custom_on_init,
    on_attach = c.custom_on_attach,
    capabilities = c.custom_capabilities(),
    root_dir = vim.loop.cwd,
})
