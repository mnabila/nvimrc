-- highlight groups
local colors = {
    active = '%#Active#',
    inactive = '%#Inactive#',
    mode = '%#Mode#',
    mode_alt = '%#ModeAlt#',
    git = '%#Git#',
    git_alt = '%#GitAlt#',
    filetype = '%#Filetype#',
    filetype_alt = '%#FiletypeAlt#',
    line_col = '%#LineCol#',
    line_col_alt = '%#LineColAlt#',
}

local is_truncated = function(width)
    local current_window = vim.fn.winnr()
    local current_width = vim.fn.winwidth(current_window)
    return current_width < width
end

local get_current_mode = function()
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
        t = {'Terminal ', 'T'},
    }

    local current_mode = vim.fn.mode()

    if is_truncated(80) then
        return string.format(' %s ', modes[current_mode][2]):upper()
    else
        return string.format(' %s ', modes[current_mode][1]):upper()
    end
end

local get_git_status = function()
    local s = vim.call('sy#repo#get_stats')
    local branch = vim.call('fugitive#head')

    if branch == '' then
        return ''
    elseif is_truncated(90) then
        return string.format(' שׂ %s ', branch)
    else
        return string.format(' +%s ~%s -%s | שׂ %s ', s[1], s[2], s[3], branch)
    end
end

local get_filename = function()
    local filetype = vim.bo.filetype
    local filename = vim.fn.expand('%:t')
    return string.format(' %s ', filename)
end

local get_filetype = function()
    local filetype = vim.bo.filetype
    local icon = require('nvim-web-devicons').get_icon(filename, filetype, {default = true})
    if filetype == '' then
        return ''
    else
        return string.format(' %s %s ', icon, filetype):lower()
    end
end

local get_line_col = function()
    if is_truncated(60) then
        return ' %l/%-L:%c '
    else
        return ' Ln %l/%-L, Col %c '
    end
end

local get_coc_status = function()
    return string.format(' %s ', vim.call('coc#status'))
end

local get_coc_curfun = function()
    local curfun = vim.fn.getbufvar(0, 'coc_current_function')
    return string.format(' %s ', curfun)
end

Statusline = {}

Statusline.active = function()
    local mid = "%="
    local mode = colors.mode .. get_current_mode()
    local git = colors.git .. get_git_status()
    local filename = colors.filetype .. get_filename()
    local filetype = colors.filetype .. get_filetype()
    local line_col = colors.line_col .. get_line_col()
    local coc_status = colors.filetype .. get_coc_status()
    local coc_curfun = colors.filetype .. get_coc_curfun()

    return table.concat({
        -- left
        colors.active,
        mode,
        git,
        filename,

        -- middle
        mid,

        -- right
        coc_status,
        coc_curfun,
        filetype,
        line_col,
    })
end

Statusline.inactive = function()
    return colors.inactive .. '%F'
end

Statusline.explorer = function()
    local title = colors.mode .. ' Explorer '
    return table.concat({colors.active, title:upper()})
end

-- set statusline
vim.cmd('augroup Statusline')
vim.cmd('au!')
vim.cmd('au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()')
vim.cmd('au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()')
vim.cmd('au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()')
vim.cmd('au WinEnter,BufEnter,FileType LuaTree setlocal statusline=%!v:lua.Statusline.explorer()')
vim.cmd('augroup END')
