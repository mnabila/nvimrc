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
  require("config.plugin.gruvbox.lazyspec"),

  -- completion
  require("config.plugin.cmp.lazyspec"),

  -- package management for neovim dependency
  require("config.plugin.mason.lazyspec"),

  -- languages server protocol
  require("config.plugin.lspconfig.lazyspec"),
  require("config.plugin.fidget.lazyspec"),
  require("config.plugin.trouble.lazyspec"),

  -- editor
  require("config.plugin.sfm.lazyspec"),
  require("config.plugin.sandwich.lazyspec"),
  require("config.plugin.easyalign.lazyspec"),
  require("config.plugin.telescope.lazyspec"),
  require("config.plugin.wakatime.lazyspec"),

  -- git
  require("config.plugin.gitsigns.lazyspec"),
  require("config.plugin.neogit.lazyspec"),

  -- interfaces
  require("config.plugin.lualine.lazyspec"),
  require("config.plugin.treesitter.lazyspec"),

  -- golang
  require("config.plugin.gopher.lazyspec"),
  require("config.plugin.gotest.lazyspec"),

  -- java
  require("config.plugin.java.lazyspec"),

  -- markdown
  require("config.plugin.markdown.lazyspec"),
}

require("lazy").setup(plugins, {
  ui = {
    border = "single",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tar",
        "tarPlugin",
        "zip",
        "zipPlugin",
        "getscript",
        "getscriptPlugin",
        "vimball",
        "vimballPlugin",
        "tohtml",
        "netrwPlugin",
        "tutor",
      },
    },
  },
  rocks = {
    hererocks = false,
    enabled = false,
  },
})
