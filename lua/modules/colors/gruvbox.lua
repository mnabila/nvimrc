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
        {'GitGutterAdd', {fg = '#98971a'}},
        {'GitGutterChange', {fg = '#D79921'}},
        {'GitGutterDelete', {fg = '#CC241D'}},
        {'SignifySignAdd', {fg = '#458588', bg = 'NONE'}},
        {'SignifySignChange', {fg = '#D79921', bg = 'NONE'}},
        {'SignifySignDelete', {fg = '#CC241D', bg = 'NONE'}},
        {'GitGutterChange', {fg = '#D79921'}},
        {'GitGutterDelete', {fg = '#CC241D'}},
        {'jsonMissingCommaError', {fg = '#CC241D'}},
        {'jsonNoQuotesError', {fg = '#CC241D'}},
        {'ColorColumn', {bg = 'NONE', fg = '#928374'}},
        {'IncSearch', {bg = '#928374', fg = '#282828', gui = 'bold'}},

        -- statusline colours
        {'Active', {bg = '#3C3836', fg = '#EBDBB2'}},
        {'Inactive', {bg = '#3C3836', fg = '#928374'}},
        {'Mode', {bg = '#928374', fg = '#1D2021', gui = "bold"}},
        {'LineCol', {bg = '#928374', fg = '#1D2021', gui = "bold"}},
        {'Git', {bg = '#504945', fg = '#EBDBB2'}},
        {'Filetype', {bg = '#504945', fg = '#EBDBB2'}},
        {'Filename', {bg = '#504945', fg = '#EBDBB2'}},

        {'ModeAlt', {bg = '#504945', fg = '#928374'}},
        {'GitAlt', {bg = '#3C3836', fg = '#504945'}},
        {'LineColAlt', {bg = '#504945', fg = '#928374'}},
        {'FiletypeAlt', {bg = '#3C3836', fg = '#504945'}},

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
