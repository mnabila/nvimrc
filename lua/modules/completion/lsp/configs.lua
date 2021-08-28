local configs = require("lspconfig/configs")

configs.emmet_ls = {
    default_config = {
        cmd = { "emmet-ls", "--stdio" },
        filetypes = { "html", "css", "javascript", "javascriptreact" },
        root_dir = vim.loop.cwd,
        settings = {},
    },
}

configs.tailwindcss_ls = {
    default_config = {
        cmd = {
            "node",
            string.format(
                "%s/.vscode-oss/extensions/bradlc.vscode-tailwindcss-0.5.10/dist/server/index.js",
                vim.loop.os_homedir()
            ),
            "--stdio",
        },
        filetypes = { "html", "css", "javascript", "javascriptreact" },
        root_dir = vim.loop.cwd,
        handlers = {
            ["tailwindcss/getConfiguration"] = function(_, _, params, _, bufnr, _)
                -- tailwindcss lang server waits for this repsonse before providing hover
                vim.lsp.buf_notify(bufnr, "tailwindcss/getConfigurationResponse", { _id = params._id })
            end,
        },
        settings = {},
    },
}
