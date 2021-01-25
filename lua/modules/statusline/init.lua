local func = require('modules.statusline.function')

-- highlight groups
local colors = {
    active = '%#StatusLineActive#',
    inactive = '%#StatusLineInactive#',
    mode = '%#StatusLineMode#',
    linecol = '%#StatusLineLineCol#',
    git = '%#StatusLineGit#',
    filetype = '%#StatuslineFiletype#',
    filename = '%#StatuslineFilename#',
    warning = '%#StatusLineWarning#',
    error = '%#StatusLineError#',
    fmicon = '%#StatusLineFileManagerIcon#',
    fmtext = '%#StatusLineFileManagerText#',
}

Statusline = {}

function Statusline.active()
    local mid = "%="
    local mode = colors.mode .. func.get_current_mode()
    local git = colors.git .. func.get_git_status()
    local filename = colors.filename .. func.get_filename()
    local filetype = colors.filetype .. func.get_filetype()
    local linecol = colors.linecol .. func.get_line_col()

    return table.concat({
        -- left
        colors.active,
        mode,
        git,
        filename,

        -- middle
        mid,

        -- right
        filetype,
        linecol
    })
end

function Statusline.inactive() return colors.inactive .. '%F' end

function Statusline.explorer()
    local title = colors.fmtext .. ' Explorer '
    local icon =  colors.fmicon  .. '   '
    return table.concat({colors.fmicon, icon,title:upper()})
end

-- set statusline
vim.cmd('augroup Statusline')
vim.cmd('au!')
vim.cmd('au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()')
vim.cmd('au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()')
vim.cmd('au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.explorer()')
vim.cmd('augroup END')
