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
    telescope.load_extension("fzy_native")

    M.keymap()
end

function M.keymap()
    local keybindings = {

        -- telescope
        {
            "n",
            "<Leader>0",
            '<CMD>lua require("telescope.builtin").oldfiles()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>b",
            '<CMD>lua require("telescope.builtin").buffers()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>o",
            '<CMD>lua require("telescope.builtin").find_files()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>m",
            '<cmd>lua require("telescope.builtin").marks()<cr>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader><Leader>",
            '<CMD>lua require("telescope.builtin").builtin()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>k",
            '<CMD>lua require("telescope.builtin").keymaps()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>c",
            '<CMD>lua require("telescope.builtin").commands()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>s",
            '<CMD>lua require("telescope.builtin").lsp_document_symbols()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>d",
            '<CMD>lua require("telescope.builtin").diagnostics({bufnr=0})<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>D",
            '<CMD>lua require("telescope.builtin").diagnostics()<CR>',
            { noremap = true, silent = true },
        },
    }
    for _, key in pairs(keybindings) do
        vim.api.nvim_set_keymap(key[1], key[2], key[3], key[4])
    end
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
