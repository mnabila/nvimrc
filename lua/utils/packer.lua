local M = {}

function M.is_loaded(plugin)
    return packer_plugins[plugin] and packer_plugins[plugin].loaded
end

function M.load(plugin, ...)
    local is_loaded, module = pcall(require, plugin)
    if is_loaded then
        module.setup(...)
    end
end

return M
