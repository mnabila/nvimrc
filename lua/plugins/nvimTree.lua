vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 35
vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 0
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_show_icons = {git = 0, folders = 1, files = 1}

-- If 0, do not show the icons for one of 'git' 'folder' and 'files'
-- 1 by default, notice that if 'files' is 1, it will only display
-- if nvim-web-devicons is installed and on your runtimepath

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {unstaged = "✗", staged = "✓", unmerged = "", renamed = "➜", untracked = "★"},
    folder = {default = " ", open = " "},
}

-- disable word wrap
vim.cmd('autocmd FileType LuaTree setlocal nowrap')
