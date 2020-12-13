local actions = require('telescope.actions')
local telescope = require('telescope')
local previewers = require('telescope.previewers')

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case'
        },
        prompt_position = "bottom",
        prompt_prefix = "❱❱",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_defaults = {
            -- TODO add builtin options.
        },
        file_sorter = require('telescope.sorters').get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        color_devicons = true,
        use_less = false,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
        file_previewer = previewers.vim_buffer_cat.new,
        grep_previewer = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        default_mappings = {
            i = {
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<CR>'] = actions.goto_file_selection_edit,

                ['<C-v>'] = actions.goto_file_selection_vsplit,
                ['<C-x>'] = actions.goto_file_selection_split,
                ['<C-t>'] = actions.goto_file_selection_tabedit,
                ['<Esc>'] = actions.close,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down
            },
            n = {
                ['<CR>'] = actions.goto_file_selection_edit,
                ['<C-v>'] = actions.goto_file_selection_vsplit,
                ['<C-x>'] = actions.goto_file_selection_split,
                ['<C-t>'] = actions.goto_file_selection_tabedit,
                ['<Esc>'] = actions.close,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,

                ['<C-u>'] = actions.preview_scrolling_up,
                ['<C-d>'] = actions.preview_scrolling_down
            }
        }
    }
}
