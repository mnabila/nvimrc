local M = {}

function M.config()
    vim.g.mkdp_auto_close = 0
    vim.g.vim_markdown_auto_insert_bullets = 0
    vim.g.vim_markdown_conceal = 0
    vim.g.vim_markdown_edit_url_in = "tab"
    vim.g.vim_markdown_folding_disabled = 1
    vim.g.vim_markdown_folding_level = 6
    vim.g.vim_markdown_follow_anchor = 1
    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_json_frontmatter = 1
    vim.g.vim_markdown_json_frontmatter = 1
    vim.g.vim_markdown_math = 1
    vim.g.vim_markdown_new_list_item_indent = 2
    vim.g.vim_markdown_no_extensions_in_markdown = 1
    vim.g.vim_markdown_strikethrough = 1
    vim.g.vim_markdown_toc_autofit = 1
    vim.g.vim_markdown_toml_frontmatter = 1
    vim.g.vim_markdown_fenced_languages = { "csharp = cs", "c++=cpp", "viml=vim", "bash=sh", "ini=dosini" }
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 0
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_open_ip = ""
    vim.g.mkdp_browser = "qutebrowser"
    vim.g.mkdp_echo_preview_url = 1
    vim.g.mkdp_browserfunc = ""
    vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = "middle",
    }
    vim.g.mkdp_markdown_css = ""
    vim.g.mkdp_highlight_css = ""
    vim.g.mkdp_port = ""
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
