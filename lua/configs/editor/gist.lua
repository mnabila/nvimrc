local M = {}

function M.config()
    vim.g.gist_browser_command = "xdg-open %URL%"
    vim.g.gist_clip_command = "xclip -selection clipboard"
    vim.g.gist_detect_filetype = 1
    vim.g.gist_get_multiplefile = 1
    vim.g.gist_open_browser_after_post = 0
    vim.g.gist_post_anonymous = 0
    vim.g.gist_post_private = 1
    vim.g.gist_show_privates = 1
    vim.g.gistvim_namelength = 32
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
