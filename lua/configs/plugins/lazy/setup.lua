local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- colorscheme
  require("configs.plugins.gruvbox.lazyspec"),

  -- completion
  require("configs.plugins.cmp.lazyspec"),

  -- package management for neovim dependency
  require("configs.plugins.mason.lazyspec"),

  -- languages server protocol
  require("configs.plugins.lspconfig.lazyspec"),
  require("configs.plugins.fidget.lazyspec"),
  require("configs.plugins.trouble.lazyspec"),

  -- editor
  require("configs.plugins.translator.lazyspec"),
  require("configs.plugins.sfm.lazyspec"),
  require("configs.plugins.sandwich.lazyspec"),
  require("configs.plugins.easyalign.lazyspec"),
  require("configs.plugins.telescope.lazyspec"),
  require("configs.plugins.wakatime.lazyspec"),

  -- git
  require("configs.plugins.gitsigns.lazyspec"),
  require("configs.plugins.diffview.lazyspec"),
  require("configs.plugins.fugitive.lazyspec"),

  -- interfaces
  require("configs.plugins.lualine.lazyspec"),
  require("configs.plugins.treesitter.lazyspec"),

  -- golang
  require("configs.plugins.gopher.lazyspec"),
  require("configs.plugins.gotest.lazyspec"),

  -- java
  require("configs.plugins.java.lazyspec"),

  -- markdown
  require("configs.plugins.glow.lazyspec"),
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
  rocks = {
    hererocks = false,
    enabled = false,
  },
})
