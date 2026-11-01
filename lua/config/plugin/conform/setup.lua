local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    ["bash"] = { "shfmt" },
    sh = { "shfmt" },
    zsh = { "shfmt" },
    sql = { "sqruff" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    markdown = { "prettier" },
    go = { "goimports" },
    php = { "phpcsfixer" },
    proto = { "buf" },
    typst = { "typstyle" },
    kdl = { "kdlfmt" },
  },
})

