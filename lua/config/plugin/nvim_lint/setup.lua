local lint = require("lint")

lint.linters_by_ft = {
  lua = { "selene" },
  sql = { "sqruff" },
  proto = { "buf" },
}

-- Create an autocommand to run linting on save and on enter
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
