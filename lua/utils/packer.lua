local M = {}

function M.loadConfig(callback)
    if _G.loadConfig then
        callback()
    end
end

function M.installMode(install)
    if install then
        _G.loadConfig = false
        return
    end
    _G.loadConfig = true
end

return M
