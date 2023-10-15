local lspconfig = require("lspconfig")
local c = require("configs.lsp.custom")

lspconfig.tsserver.setup(c.default({
    root_dir = c.custom_cwd,
    settings = {
        tsserver = {
            useBatchedBufferSync = true,
        },
        javascript = {
            autoClosingTags = true,
            suggest = {
                autoImports = true,
            },
            updateImportsOnFileMove = {
                enable = true,
            },
            suggestionActions = {
                enabled = true,
            },
        },
    },
}))

lspconfig.lua_ls.setup(c.default({
    cmd = { "lua-language-server", string.format("--logpath=%s/.cache/nvim/sumneko_lua", vim.loop.os_homedir()) },
    root_dir = c.custom_cwd,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            telemetry = {
                enable = false,
            },
            diagnostics = {
                enable = true,
                globals = { "vim", "awesome", "use", "client", "root", "s", "screen" },
            },
        },
    },
}))

lspconfig.gopls.setup(c.default({
    cmd = { "gopls", "serve" },
    root_dir = c.custom_cwd,
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            usePlaceholders = false,
        },
    },
}))

lspconfig.yamlls.setup(c.default({
    settings = {
        yaml = {
            format = {
                enable = true,
                singleQuote = true,
                bracketSpacing = true,
            },
            editor = {
                tabSize = 2,
            },
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "ci.yml",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "compose.yml",
            },
        },
    },
}))

lspconfig.emmet_ls.setup(c.default({
    filetypes = {
        "html",
        "typescriptreact",
        "javascriptreact",
        "css",
        "sass",
        "scss",
        "less",
        "gohtmltmpl",
    },
}))

local servers = { "dockerls", "bashls", "vimls", "cssls", "bufls"}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(c.default())
end
