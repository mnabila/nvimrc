local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

local specs = {
  -- completion
  "config.plugin.blink.spec",

  -- languages server protocol
  "config.plugin.nonels.spec",
  "config.plugin.trouble.spec",
  "config.plugin.navic.spec",
  "config.plugin.mason.spec",

  -- debuging adapter protocol
  "config.plugin.dap.spec",

  -- fuzzy finder
  "config.plugin.telescope.spec",

  -- editor
  "config.plugin.sfm.spec",
  "config.plugin.mini_surround.spec",
  "config.plugin.mini_pairs.spec",
  "config.plugin.mini_align.spec",
  "config.plugin.wakatime.spec",
  "config.plugin.fidget.spec",
  "config.plugin.colorizer.spec",

  -- git
  "config.plugin.gitsigns.spec",
  "config.plugin.neogit.spec",

  -- interfaces
  "config.plugin.treesitter.spec",

  -- golang
  "config.plugin.gopher.spec",
  "config.plugin.gotest.spec",

  -- markdown
  "config.plugin.markdown.spec",

  -- plantuml
  "config.plugin.plantuml.spec",
  "config.plugin.preview.spec",

  -- hugo
  "config.plugin.hugo.spec",

  -- ai
  "config.plugin.codecompanion.spec",
}

local adapter = require("config.plugin.lazy.adapter")

local plugins = vim.tbl_map(function(name)
  return adapter.wrap_spec(require(name))
end, specs)

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
