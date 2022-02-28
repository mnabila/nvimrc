local M = {}

function M.config()
    local telescope = require("telescope")
    local previewers = require("telescope.previewers")

    local options = {
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = "❱❱ ",
            selection_caret = "❱ ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "descending",
            layout_strategy = "bottom_pane",
            layout_config = {
                height = 0.6,
                prompt_position = "bottom",
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = { "absolute" },
            winblend = 0,
            borderchars = {
                prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                results = { "─", " ", " ", " ", "─", "─", " ", " " },
                preview = { "─", " ", " ", "│", "┬", " ", " ", "│" },
            },
            color_devicons = true,
            use_less = false,
            file_previewer = previewers.vim_buffer_cat.new,
            grep_previewer = previewers.vim_buffer_vimgrep.new,
            qflist_previewer = previewers.vim_buffer_qflist.new,
        },
        pickers = {
            diagnostics = {
                previewer = false,
            },
            find_files = {
                previewer = false,
            },
            oldfiles = {
                previewer = false,
                file_ignore_patterns = { "/usr/share/nvim/runtime/*" },
            },
            builtin = {
                previewer = false,
            },
            current_buffer_fuzzy_find = {
                previewer = false,
            },
            autocommands = {
                previewer = false,
            },
        },
    }

    telescope.setup(options)
    -- telescope.load_extension("fzy_native")

    local key = require("utils.keymap")
    key.map("<Leader>0", '<CMD>lua require("telescope.builtin").oldfiles()<CR>')
    key.map("<Leader>b", '<CMD>lua require("telescope.builtin").buffers()<CR>')
    key.map("<Leader>o", '<CMD>lua require("telescope.builtin").find_files()<CR>')
    key.map("<Leader>m", '<cmd>lua require("telescope.builtin").marks()<cr>')
    key.map("<Leader><Leader>", '<CMD>lua require("telescope.builtin").builtin()<CR>')
    key.map("<Leader>k", '<CMD>lua require("telescope.builtin").keymaps()<CR>')
    key.map("<Leader>c", '<CMD>lua require("telescope.builtin").commands()<CR>')
    key.map("<Leader>s", '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>')
    key.map("<Leader>D", '<CMD>lua require("telescope.builtin").diagnostics()<CR>')
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
