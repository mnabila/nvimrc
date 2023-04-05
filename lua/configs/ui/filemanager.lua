require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "single",
    enable_git_status = false,
    enable_diagnostics = false,
    default_component_configs = {
        indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            with_expanders = nil,
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
        },
        icon = {
            folder_closed = " ",
            folder_open = " ",
            folder_empty = " ",
            default = " ",
            highlight = "Directory",
        },
        modified = {
            symbol = "",
            highlight = "GitSignChange",
        },
        name = {
            trailing_slash = false,
            highlight = "Normal",
        },
    },
    window = {
        position = "left",
        width = 40,
        mappings = {
            ["o"] = "toggle_node",
        },
    },
    nesting_rules = {},
    filesystem = {
        filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = false,
            hide_by_name = {
                ".DS_Store",
                "thumbs.db",
                "node_modules",
            },
        },
        follow_current_file = true,
        hijack_netrw_behavior = "open_default",
        use_libuv_file_watcher = true,
    },
    buffers = {
        show_unloaded = true,
        window = {
            mappings = {
                ["bd"] = "buffer_delete",
            },
        },
    },
    git_status = {
        window = {
            position = "float",
            mappings = {
                ["A"] = "git_add_all",
                ["gu"] = "git_unstage_file",
                ["ga"] = "git_add_file",
                ["gr"] = "git_revert_file",
                ["gc"] = "git_commit",
                ["gp"] = "git_push",
                ["gg"] = "git_commit_and_push",
            },
        },
    },
    source_selector = {
        winbar = true,
        tab_labels = {
            filesystem = "   Files ",
            buffers = "   Buffers ",
            git_status = "   Git ",
            diagnostics = " 裂 Diagnostics ",
        },
    },
})

vim.keymap.set("n", "`", "<CMD>NeoTreeFocusToggle<CR>", { desc = "open file manager", silent = true })
