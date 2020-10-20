require('bufferline').setup{
    options = {
        view = "default",
        numbers = "none",
        number_style = "",
        mappings = true,
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        max_name_length = 18,
        tab_size = 18,
        show_buffer_close_icons = true,
        separator_style = 'thin',
        enforce_regular_tabs = false,
        always_show_bufferline = true,
    },
    highlights = {
        bufferline_tab = {guifg = comment_fg, guibg = normal_bg},
        bufferline_tab_selected = {guifg = normal_bg, guibg = normal_bg, gui = 'bold,italic'},
        bufferline_buffer = {guifg = '#00ff00', guibg = '#ff0000'},
        bufferline_buffer_inactive = {guifg = comment_fg, guibg = normal_bg},
        bufferline_modified = {guifg = diff_add_fg, guibg = 'none'},
        bufferline_separator = {guibg = normal_bg},
        bufferline_selected = {guifg = normal_fg, guibg = normal_bg, gui = 'bold,italic'},
    },
}
