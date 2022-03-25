local M = {}

function M.config()
    vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }
    vim.g.nvim_tree_respect_buf_cwd = 1
    vim.g.nvim_tree_indent_markers = 1
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_highlight_opened_files = 1

    require("nvim-tree").setup({
        disable_netrw = true,
        hijack_netrw = true,
        open_on_setup = false,
        ignore_ft_on_setup = {},
        auto_close = false,
        open_on_tab = true,
        update_to_buf_dir = {
            enable = true,
            auto_open = true,
        },
        hijack_cursor = false,
        update_cwd = true,
        diagnostics = {
            enable = false,
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        },
        system_open = {
            cmd = nil,
            args = {},
        },
        filters = {
            dotfiles = false,
            custom = { ".git", "node_modules", ".cache", "__pycache__" },
        },
        git = {
            enable = true,
            ignore = false,
        },
        view = {
            width = 35,
            side = "left",
            auto_resize = true,
            mappings = {
                custom_only = false,
                list = {},
            },
        },
    })
    vim.keymap.set("n", "`", "<CMD>NvimTreeToggle<CR>", { desc = "open file manager" })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
