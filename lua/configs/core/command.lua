local command = vim.api.nvim_add_user_command
local bo = vim.bo

command("WriteAndReload", function()
    if bo.filetype == "vim" then
        vim.cmd("write")
        vim.cmd("source %")
    elseif bo.filetype == "lua" then
        vim.cmd("write")
        vim.cmd("luafile %")
    end
end, { nargs = 0 })
