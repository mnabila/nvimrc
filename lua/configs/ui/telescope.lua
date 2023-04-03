local M = {}

function M.config()
    local telescope = require("telescope")
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")

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
            results_title = "",
            entry_prefix = "   ",
            multi_icon = " ❱ ",
            prompt_prefix = "❱❱ ",
            selection_caret = " ❱ ",
            initial_mode = "insert",
            selection_strategy = "reset",
            file_ignore_patterns = { "^node_modules/" },
            file_sorter = sorters.get_fzy_sorter,
            generic_sorter = sorters.get_generic_fzy_sorter,
            path_display = { "absolute" },
            winblend = 0,
            color_devicons = true,
            use_less = false,
            file_previewer = previewers.vim_buffer_cat.new,
            grep_previewer = previewers.vim_buffer_vimgrep.new,
            qflist_previewer = previewers.vim_buffer_qflist.new,
            -- custom theme
            sorting_strategy = "descending",
            layout_strategy = "bottom_pane",
            layout_config = {
                preview_cutoff = 1,
                height = 0.6,
                prompt_position = "bottom",
            },
            borderchars = {
                prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
                results = { "─", " ", " ", " ", "─", "─", " ", " " },
                preview = { "─", " ", " ", "│", "┬", " ", " ", "│" },
            },
        },
        pickers = {
            diagnostics = {
                previewer = false,
                line_width = 0.7,
                no_unlisted = true,
                path_display = {
                    "hidden",
                },
            },
            find_files = {
                previewer = false,
            },
            oldfiles = {
                previewer = false,
                file_ignore_patterns = {
                    "/usr/share/nvim/runtime/*",
                    vim.fn.stdpath("data"),
                    vim.fn.stdpath("cache"),
                    vim.fn.stdpath("log"),
                },
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
            lsp_document_symbols = {
                previewer = false,
                symbol_width = 0.7,
            },
            lsp_workspace_symbols = {
                previewer = false,
                symbol_width = 0.7,
            },
            buffers = {
                previewer = false,
            },
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = true,
                override_file_sorter = true,
            },
        },
    }

    telescope.setup(options)
    telescope.load_extension("ui-select")
    telescope.load_extension("fzy_native")

    M.keymap()
end

function M.keymap()
    local keymap = vim.keymap
    keymap.set(
        "n",
        "<Leader>0",
        require("telescope.builtin").oldfiles,
        { desc = "Telescope: Lists previously open files" }
    )
    keymap.set(
        "n",
        "<Leader>b",
        require("telescope.builtin").buffers,
        { desc = "Telescope: Lists open buffers in current neovim instance" }
    )
    keymap.set("n", "<Leader>o", require("telescope.builtin").find_files, { desc = "Telescope: Open files" })
    keymap.set("n", "<Leader>m", require("telescope.builtin").marks, { desc = "Telescope: Lists vim marks" })
    keymap.set(
        "n",
        "<Leader><Leader>",
        require("telescope.builtin").builtin,
        { desc = "Telescope: Open builtin function" }
    )
    keymap.set(
        "n",
        "<Leader>k",
        require("telescope.builtin").keymaps,
        { desc = "Telescope: Lists normal mode keymappings" }
    )
    keymap.set("n", "<Leader>c", require("telescope.builtin").commands, { desc = "Telescope: Lists vim autocommands" })
    keymap.set(
        "n",
        "<Leader>a",
        require("telescope.builtin").lsp_document_symbols,
        { desc = "Telescope: Lists LSP document symbols in the current buffer" }
    )
    keymap.set("n", "<Leader>d", require("telescope.builtin").diagnostics, { desc = "Telescope: Lists diagnostics" })
end

return M.config()
