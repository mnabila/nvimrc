local M = {}

function M.is_loaded(plugin)
    return packer_plugins[plugin] and packer_plugins[plugin].loaded
end

return M
