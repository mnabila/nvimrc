---@class SpecPackage
---@field url string               -- Remote repository URL (e.g., "author/plugin")
---@field dir? string              -- Local directory path for the plugin (e.g., /home/user/git/plugin.nvim)
---@field version? string          -- Optional version tag or semver (e.g., "v1.0.0")
---@field branch? string           -- Optional git branch to use
---@field lock? boolean            -- If true, plugin is pinned and won't be updated
---@field dev? boolean             -- If true, use 'dir' as local development directory; if false, use 'url' as remote repository

---@class SpecLoader
---@field cmd? string | string[]    -- Command(s) that trigger lazy loading (e.g., ":MyPlugin")
---@field event? string | string[]  -- Event(s) that trigger lazy loading (e.g., "BufRead")
---@field ft? string | string[]     -- Filetype(s) that trigger lazy loading (e.g., "lua", {"lua", "markdown"})
---@field keymap? string | string[] -- Keymap(s) that trigger lazy loading (e.g., "<leader>p")

---@class TemplateSpec
---@field package SpecPackage       -- Plugin source and versioning info
---@field loader? SpecLoader        -- Lazy-loading options
---@field deps? TemplateSpec[]      -- Optional list of plugin dependencies
---@field config? true | fun()      -- Configuration function or `true` to use plugin defaults
---@field init? fun()               -- Optional initialization function (runs before loading)
