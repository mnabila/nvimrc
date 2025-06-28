---@class SpecPackage
---@field source string           -- GitHub repo string (e.g., "author/plugin")
---@field version? string         -- Optional version tag/semver

---@class SpecLoader
---@field cmd? string|string[]    -- Command(s) to lazy-load plugin
---@field event? string|string[]  -- Event(s) to lazy-load plugin
---@field ft? string|string[]     -- Filetype(s) to lazy-load plugin
---@field keymap? string|string[] -- Keymap(s) to lazy-load plugin

---@class TemplateSpec
---@field package SpecPackage     -- Package information
---@field loader? SpecLoader      -- Lazy load trigger options
---@field deps? TemplateSpec[]    -- Optional nested plugin dependencies
---@field config? true | fun()    -- Plugin config (setup) function or true to use default
---@field init? fun()             -- Plugin init (setup) function or true to use default

local adapter = {}

---Convert a TemplateSpec to Lazy.nvim-compatible spec
---@param spec TemplateSpec
---@return table LazySpec
function adapter.wrap_spec(spec)
  local lazy_spec = {}

  -- Add source and version
  if spec.package then
    table.insert(lazy_spec, spec.package.source)
    if spec.package.version then
      lazy_spec.version = spec.package.version
    end
  end

  -- Add loader keys
  if spec.loader then
    for key, value in pairs(spec.loader) do
      lazy_spec[key] = value
    end
  end

  -- Add config
  if spec.config ~= nil then
    lazy_spec.config = spec.config
  end

  -- Add init setup
  if spec.init ~= nil then
    lazy_spec.init = spec.init
  end

  -- Recursively wrap dependencies
  if spec.deps then
    lazy_spec.dependencies = vim.tbl_map(adapter.wrap_spec, spec.deps)
  end

  return lazy_spec
end

return adapter
