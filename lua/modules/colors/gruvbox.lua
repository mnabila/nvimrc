local function hl(group, options)
    local bg = options.bg == nil and '' or 'guibg=' .. options.bg
    local fg = options.fg == nil and '' or 'guifg=' .. options.fg
    local gui = options.gui == nil and '' or 'gui=' .. options.gui

    vim.cmd(string.format('hi %s %s %s %s', group, bg, fg, gui))
end

function ApplyGruvbox()
    local highlights = {
        -- normal stuff
        {'Normal', {bg = 'NONE'}},
        {'SignColumn', {bg = 'NONE'}},
        {'ColorColumn', {bg = 'NONE', fg = '#928374'}},
        {'IncSearch', {bg = '#928374', fg = '#282828', gui = 'bold'}},
        {'VertSplit', {bg = '#3C3836', fg = '#3C3836'}},

        -- signify
        {'SignifySignAdd', {fg = '#458588', bg = 'NONE'}},
        {'SignifySignChange', {fg = '#D79921', bg = 'NONE'}},
        {'SignifySignDelete', {fg = '#CC241D', bg = 'NONE'}},

        -- statusline colours
        {'StatusLine', {bg = '#3C3836', fg = '#3C3836'}},
        {'StatusLineActive', {bg = '#3C3836', fg = '#EBDBB2'}},
        {'StatusLineInactive', {bg = '#3C3836', fg = '#928374'}},

        {'StatusLineMode', {bg = '#EBDBB2', fg = '#282828', gui = 'bold'}},
        {'StatusLineFileManagerIcon', {bg = '#EBDBB2', fg = '#3C3836'}},
        {'StatusLineLineCol', {bg = '#EBDBB2', fg = '#3C3836', gui = 'bold'}},

        {'StatusLineFiletype', {bg = '#BDAE93', fg = '#3C3836'}},
        {'StatusLineGit', {bg = '#BDAE93', fg = '#3C3836'}},
        {'StatusLineFileManagerText', {bg = '#BDAE93', fg = '#3C3836', gui = 'bold'}},

        {'StatusLineFilename', {bg = '#3C3836', fg = '#D5C4A1'}},

        {'StatusLineError', {bg = '#FB4934', fg = '#3C3836'}},
        {'StatusLineWarning', {bg = '##fabd2f', fg = '#3C3836'}},

        -- luatree
        {'NvimTreeFolderIcon', {fg = '#D79921'}},
        {'NvimTreeIndentMarker', {fg = '#928374'}},

        -- telescope
        {'TelescopeSelection', {bg = 'NONE', fg = '#D79921', gui = 'bold'}},
        {'TelescopeMatching', {bg = 'NONE', fg = '#D79921', gui = 'bold'}},
        {'TelescopePreviewBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopePromptBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopeResultsBorder', {bg = 'NONE', fg = '#928374', gui = 'bold'}},
        {'TelescopePromptPrefix', {bg = 'NONE', fg = '#D79921'}},

        -- coc.nvim
        {'CocErrorFloat', {bg = 'NONE', fg = '#FB4934'}},
        {'CocErrorSign', {bg = 'NONE', fg = '#FB4934'}},
        {'CocHintSign', {bg = 'NONE', fg = '#83A598'}},
        {'CocInfoSign', {bg = 'NONE', fg = '#FABD2F'}},
        {'CocWarningSign', {bg = 'NONE', fg = '#FE8019'}},

        -- diagnostic-nvim
        {'LspDiagnosticsDefaultError', {bg = 'NONE', fg = '#FB4934'}},
        {'LspDiagnosticsDefaultInformation', {bg = 'NONE', fg = '#D3869B'}},
        {'LspDiagnosticsDefaultWarning', {bg = 'NONE', fg = '#FABD2F'}},
        {'LspDiagnosticsDefaultHint', {bg = 'NONE', fg = '#83A598'}},

        -- barbar
        {'BufferCurrent', {bg = 'NONE', fg = '#EBDBB2', gui = 'bold'}},
        {'BufferCurrentMod', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferCurrentSign', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferCurrentTarget', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferVisible', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferVisibleMod', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferVisibleSign', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferVisibleTarget', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferInactive', {bg = 'NONE', fg = '#928374'}},
        {'BufferInactiveMod', {bg = 'NONE', fg = '#928374'}},
        {'BufferInactiveSign', {bg = 'NONE', fg = '#928374'}},
        {'BufferInactiveTarget', {bg = 'NONE', fg = '#928374'}},
        {'BufferTabpages', {bg = 'NONE', fg = '#EBDBB2'}},
        {'BufferTabpageFill', {bg = 'NONE', fg = '#EBDBB2'}},

        -- lspsaga
        {'LspFloatWinBorder', {bg = 'NONE', fg = '#928374'}},
        {'ProviderTruncateLine', {bg = 'NONE', fg = '#928374'}},
        {'LspSagaDocTruncateLine', {bg = 'NONE', fg = '#928374'}},
        {'LspSagaCodeActionTruncateLine', {bg = 'NONE', fg = '#928374'}},
    }

    for _, highlight in pairs(highlights) do hl(highlight[1], highlight[2]) end
end

-- italicize comments
hl('Comment', {gui = 'italic'})

-- automatically override colourscheme
vim.cmd('augroup NewColor')
vim.cmd('au!')
vim.cmd('au ColorScheme gruvbox8 call v:lua.ApplyGruvbox()')
vim.cmd('augroup END')

-- disable invert selection for gruvbox
vim.g.gruvbox_invert_selection = false

vim.cmd('colors gruvbox8')
