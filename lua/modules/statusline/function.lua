local devicons = require('nvim-web-devicons')
local M = {}

M.is_truncated = function(width)
    local current_window = vim.fn.winnr()
    local current_width = vim.fn.winwidth(current_window)
    return current_width < width
end

M.get_current_mode = function()
    local modes = {
        n = {'Normal', 'N'},
        no = {'N·Pending', 'N'},
        v = {'Visual', 'V'},
        V = {'V·Line', 'V'},
        [''] = {'V·Block', 'V'},
        s = {'Select', 'S'},
        S = {'S·Line', 'S'},
        ['^S'] = {'S·Block', 'S'},
        i = {'Insert', 'I'},
        R = {'Replace', 'R'},
        Rv = {'V·Replace', 'V'},
        c = {'Command', 'C'},
        cv = {'Vim Ex ', 'V'},
        ce = {'Ex ', 'E'},
        r = {'Prompt ', 'P'},
        rm = {'More ', 'M'},
        ['r?'] = {'Confirm ', 'C'},
        ['!'] = {'Shell ', 'S'},
        t = {'Terminal ', 'T'}
    }

    local current_mode = vim.fn.mode()

    if M.is_truncated(80) then
        return string.format(' %s ', modes[current_mode][2]):upper()
    else
        return string.format(' %s ', modes[current_mode][1]):upper()
    end
end

M.get_git_status = function()
    -- local signs = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}
    local s = vim.call('sy#repo#get_stats')
    local branch = vim.call('fugitive#head')

    if branch == '' then
        return ''
    elseif M.is_truncated(90) then
        return string.format('  %s ', branch)
    else
        return string.format(' +%s ~%s -%s |  %s ', s[1], s[2], s[3], branch)
    end
end

M.get_filename = function()
    local filename = nil
    if M.is_truncated(90) then
        filename = vim.fn.expand('%:t')
    else
        filename = vim.fn.expand('%')
    end
    return string.format(' %s ', filename)
end

M.get_filetype = function()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%')
    local icon = devicons.get_icon(filename, filetype, {default = true})
    if filetype == '' then
        return ''
    else
        return string.format(' %s %s ', icon, filetype):lower()
    end
end


M.get_line_col = function()
    if M.is_truncated(60) then
        return '  %l  %c '
    else
        return '  %l/%-L  %c '
    end
end

-- M.get_coc_status = function() return string.format(' %s ', vim.call('coc#status')) end

-- M.get_coc_curfun = function()
--     local curfun = vim.fn.getbufvar(0, 'coc_current_function')
--     return string.format(' %s ', curfun)
-- end

-- M.get_lsp_diagnstic_count = function()
--     if not vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
--         local error_count = vim.lsp.diagnostic.get_count([[Error]])
--         local warning_count = vim.lsp.diagnostic.get_count([[Warning]])
--         return string.format(' E:%s W:%s ', error_count, warning_count)
--     else
--         return ' '
--     end
-- end

return M

