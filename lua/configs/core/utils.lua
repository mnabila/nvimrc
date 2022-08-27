local M = {}
function M.hlprop(hlname)
    local hl = vim.api.nvim_get_hl_by_name(hlname, true)
    local styles = {}

    for k, v in ipairs(hl) do
        if v == true then
            styles[#styles + 1] = k
        end
    end

    return {
        name = hlname,
        fg = hl.foreground and string.format("#%06x", hl.foreground),
        bg = hl.background and string.format("#%06x", hl.background),
        style = next(styles) and table.concat(styles, ",") or "NONE",
    }
end

return M
