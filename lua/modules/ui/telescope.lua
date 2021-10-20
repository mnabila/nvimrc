local M = {}

function M.config()
    local telescope = require("telescope")
    local previewers = require("telescope.previewers")

    telescope.setup({
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
            layout_strategy = "flex",
            layout_config = {
                horizontal = {
                    mirror = false,
                    height = 0.7,
                },
                vertical = {
                    mirror = false,
                    height = 0.7,
                },
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = { "absolute" },
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
            color_devicons = true,
            use_less = false,
            set_env = { ["COLORTERM"] = "truecolor" }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
            file_previewer = previewers.vim_buffer_cat.new,
            grep_previewer = previewers.vim_buffer_vimgrep.new,
            qflist_previewer = previewers.vim_buffer_qflist.new,
        },
    })

    telescope.load_extension("fzy_native")

    M.keymap()
end

function M.keymap()
    local keybindings = {

        -- telescope
        {
            "n",
            "<Leader><space>",
            '<CMD>lua require("telescope.builtin").oldfiles({file_ignore_patterns = {"/usr/share/nvim/runtime/*"}, previewer = false})<CR>',
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
            '<CMD>lua require("telescope.builtin").find_files({previewer = false})<CR>',
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
            '<CMD>lua require("telescope.builtin").builtin({previewer = false})<CR>',
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
            "<Leader>/",
            '<CMD>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>?",
            '<CMD>lua require("telescope.builtin").grep_string()<CR>',
            { noremap = true, silent = true },
        },
        {
            "n",
            "<Leader>c",
            '<CMD>lua require("telescope.builtin").commands()<CR>',
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
