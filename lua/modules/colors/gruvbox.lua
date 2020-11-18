-- local get_color = function(group)
--     local gui_color = vim.fn.synIDattr(vim.fn.hlID(group), "fg", "gui")
--     local term_color = vim.fn.synIDattr(vim.fn.hlID(group), "fg", "cterm")
--     return {gui_color, term_color}
-- end
local hl = function(group, options)
    local bg = options.bg == nil and '' or 'guibg=' .. options.bg
    local fg = options.fg == nil and '' or 'guifg=' .. options.fg
    local gui = options.gui == nil and '' or 'gui=' .. options.gui

    vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

ApplyGruvbox = function()
    local highlights = {
        -- normal stuff
        {'Normal', {bg = 'NONE'}},
        {'SignColumn', {bg = 'NONE'}},
        {'ColorColumn', {bg = 'NONE', fg = '#928374'}},
        {'IncSearch', {bg = '#928374', fg = '#282828', gui = 'bold'}},

        -- signify
        {'SignifySignAdd', {fg = '#458588', bg = 'NONE'}},
        {'SignifySignChange', {fg = '#D79921', bg = 'NONE'}},
        {'SignifySignDelete', {fg = '#CC241D', bg = 'NONE'}},

        -- statusline colours
        {'StatusLineActive', {bg = '#3C3836', fg = '#EBDBB2'}},
        {'StatusLineInactive', {bg = '#3C3836', fg = '#928374'}},

        {'StatusLineMode', {bg = '#EBDBB2', fg = '#282828', gui = 'bold'}},
        {'StatusLineFileManagerIcon', {bg = '#EBDBB2', fg = '#3C3836'}},
        {'StatusLineLineCol', {bg = '#EBDBB2', fg = '#3C3836', gui='bold'}},

        {'StatusLineFiletype', {bg = '#BDAE93', fg = '#3C3836'}},
        {'StatusLineGit', {bg = '#BDAE93', fg = '#3C3836'}},
        {'StatusLineFileManagerText', {bg = '#BDAE93', fg = '#3C3836', gui='bold'}},

        {'StatusLineFilename', {bg = '#3C3836', fg = '#D5C4A1'}},

        {'StatusLineError', {bg = '#FB4934', fg = '#3C3836'}},
        {'StatusLineWarning', {bg = '##fabd2f', fg = '#3C3836'}},

        -- luatree
        {'LuaTreeFolderIcon', {fg = '#D79921'}},
        {'LuaTreeIndentMarker', {fg = '#928374'}},

        -- telescope
        {'TelescopeSelection', {bg = 'NONE', fg = '#D79921', gui = 'bold'}},
        {'TelescopeMatching', {bg = 'NONE', fg = '#CC241D', gui = 'bold'}},
        {'TelescopePreviewBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopePromptBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopeResultsBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},

        -- coc.nvim
        {'CocErrorFloat', {bg = 'NONE', fg = '#fb4934'}},
        {'CocErrorSign', {bg = 'NONE', fg = '#fb4934'}},
        {'CocHintSign', {bg = 'NONE', fg = '#83a598'}},
        {'CocInfoSign', {bg = 'NONE', fg = '#fabd2f'}},
        {'CocWarningSign', {bg = 'NONE', fg = '#fe8019'}},

        -- diagnostic-nvim
        {'LspDiagnosticsDefaultError', {bg = 'NONE', fg = '#fb4934'}},
        {'LspDiagnosticsDefaultInformation', {bg = 'NONE', fg = '#d3869b'}},
        {'LspDiagnosticsDefaultWarning', {bg = 'NONE', fg = '#fabd2f'}},
        {'LspDiagnosticsDefaultHint', {bg = 'NONE', fg = '#83a598'}}
    }

    for _, highlight in pairs(highlights) do hl(highlight[1], highlight[2]) end
end

-- italicize comments
hl('Comment', {gui = 'italic'})

-- automatically override colourscheme
vim.cmd('augroup NewColor')
vim.cmd('au!')
vim.cmd('au ColorScheme gruvbox call v:lua.ApplyGruvbox()')
vim.cmd('augroup END')

-- disable invert selection for gruvbox
vim.g.gruvbox_invert_selection = false

vim.cmd('colors gruvbox')
