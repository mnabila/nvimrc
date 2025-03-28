local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  -- colorscheme
  require("plugin.gruvbox.lazyspec"),

  -- completion
  -- require("plugin.cmp.lazyspec"),
  require("plugin.blink.lazyspec"),

  -- package management for neovim dependency
  require("plugin.mason.lazyspec"),

  -- languages server protocol
  require("plugin.nonels.lazyspec"),
  require("plugin.fidget.lazyspec"),
  require("plugin.trouble.lazyspec"),

  -- fuzzy finder
  require("plugin.telescope.lazyspec"),

  -- editor
  require("plugin.sfm.lazyspec"),
  require("plugin.mini_surround.lazyspec"),
  require("plugin.mini_pairs.lazyspec"),
  require("plugin.mini_align.lazyspec"),
  require("plugin.wakatime.lazyspec"),

  -- git
  require("plugin.gitsigns.lazyspec"),
  require("plugin.neogit.lazyspec"),

  -- interfaces
  require("plugin.treesitter.lazyspec"),

  -- golang
  require("plugin.gopher.lazyspec"),
  require("plugin.gotest.lazyspec"),

  -- markdown
  require("plugin.markdown.lazyspec"),

  -- plantuml
  require("plugin.plantuml.lazyspec"),
  require("plugin.preview.lazyspec"),

  -- ai
  require("plugin.codecompanion.lazyspec"),
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
