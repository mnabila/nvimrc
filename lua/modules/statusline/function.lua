local devicons = require('nvim-web-devicons')
local M = {}

function M.is_truncated(width)
    local current_window = vim.fn.winnr()
    local current_width = vim.fn.winwidth(current_window)
    return current_width < width
end

function M.get_current_mode()
    local modes = {
        n      = {'Normal', 'N'},
        no     = {'N·Pending', 'N'},
        v      = {'Visual', 'V'},
        V      = {'V·Line', 'V'},
        [''] = {'V·Block', 'V'},
        s      = {'Select', 'S'},
        S      = {'S·Line', 'S'},
        ['^S'] = {'S·Block', 'S'},
        i      = {'Insert', 'I'},
        R      = {'Replace', 'R'},
        Rv     = {'V·Replace', 'V'},
        c      = {'Command', 'C'},
        cv     = {'Vim Ex ', 'V'},
        ce     = {'Ex ', 'E'},
        r      = {'Prompt ', 'P'},
        rm     = {'More ', 'M'},
        ['r?'] = {'Confirm ', 'C'},
        ['!']  = {'Shell ', 'S'},
        t      = {'Terminal ', 'T'}
    }

    local current_mode = vim.fn.mode()

    if M.is_truncated(80) then
        return string.format(' %s ', modes[current_mode][2]):upper()
    else
        return string.format(' %s ', modes[current_mode][1]):upper()
    end
end

function M.get_git_status()
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

function M.get_filename()
    local filename = nil
    if M.is_truncated(90) then
        filename = vim.fn.expand('%:t')
    else
        filename = vim.fn.expand('%')
    end
    return string.format(' %s ', filename)
end

function M.get_filetype()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%')
    local icon = devicons.get_icon(filename, filetype, {default = true})
    if filetype == '' then
        return ''
    else
        return string.format(' %s %s ', icon, filetype):lower()
    end
end

function M.get_line_col()
    if M.is_truncated(60) then
        return '  %l  %c '
    else
        return '  %l/%-L  %c '
    end
end

return M

