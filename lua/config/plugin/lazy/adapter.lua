-- load type definition
require("config.types.plugin_spec")

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
    if spec.package.lock then
      lazy_spec.pin = spec.package.lock
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
