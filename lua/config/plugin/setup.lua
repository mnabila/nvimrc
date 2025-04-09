local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- colorscheme
  -- require("config.plugin.gruvbox.lazyspec"),

  -- completion
  require("config.plugin.blink.lazyspec"),

  -- package management for neovim dependency
  require("config.plugin.mason.lazyspec"),

  -- languages server protocol
  require("config.plugin.nonels.lazyspec"),
  require("config.plugin.trouble.lazyspec"),
  require("config.plugin.navic.lazyspec"),

  -- fuzzy finder
  require("config.plugin.telescope.lazyspec"),

  -- editor
  require("config.plugin.sfm.lazyspec"),
  require("config.plugin.mini_surround.lazyspec"),
  require("config.plugin.mini_pairs.lazyspec"),
  require("config.plugin.mini_align.lazyspec"),
  require("config.plugin.wakatime.lazyspec"),
  require("config.plugin.fidget.lazyspec"),
  require("config.plugin.colorizer.lazyspec"),

  -- git
  require("config.plugin.gitsigns.lazyspec"),
  require("config.plugin.neogit.lazyspec"),

  -- interfaces
  require("config.plugin.treesitter.lazyspec"),

  -- golang
  require("config.plugin.gopher.lazyspec"),
  require("config.plugin.gotest.lazyspec"),

  -- markdown
  require("config.plugin.markdown.lazyspec"),

  -- plantuml
  require("config.plugin.plantuml.lazyspec"),
  require("config.plugin.preview.lazyspec"),

  -- ai
  require("config.plugin.codecompanion.lazyspec"),
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
