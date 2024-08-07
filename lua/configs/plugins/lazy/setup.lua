local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- colorscheme
  require("configs.plugins.gruvbox.lazyspec"),

  -- completion
  require("configs.plugins.cmp.lazyspec"),

  -- languages server protocol
  require("configs.plugins.lspconfig.lazyspec"),
  require("configs.plugins.fidget.lazyspec"),
  require("configs.plugins.trouble.lazyspec"),

  -- editor
  require("configs.plugins.gitsigns.lazyspec"),
  require("configs.plugins.translator.lazyspec"),
  require("configs.plugins.sfm.lazyspec"),
  require("configs.plugins.sandwich.lazyspec"),
  require("configs.plugins.easyalign.lazyspec"),
  require("configs.plugins.diffview.lazyspec"),
  require("configs.plugins.telescope.lazyspec"),
  require("configs.plugins.fugitive.lazyspec"),
  require("configs.plugins.wakatime.lazyspec"),
  require("configs.plugins.glow.lazyspec"),

  -- interfaces
  require("configs.plugins.lualine.lazyspec"),
  require("configs.plugins.treesitter.lazyspec"),

  -- languages
  -- golang
  require("configs.plugins.gopher.lazyspec"),
  require("configs.plugins.gotest.lazyspec"),
}

require("lazy").setup(plugins, {
  ui = {
    border = "single",
  },
  performance = {
    rtp = {
      disabled_plugins = require("configs.enums.disabled_plugins"),
    },
  },
})
