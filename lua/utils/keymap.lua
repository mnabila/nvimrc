local M = {}

function M.map(key, command)
    vim.api.nvim_set_keymap("n", key, command, { noremap = false })
end

function M.vmap(key, command)
    vim.api.nvim_set_keymap("v", key, command, { noremap = false })
end

function M.noremap(key, command)
    vim.api.nvim_set_keymap("n", key, command, { noremap = true })
end

function M.vnoremap(key, command)
    vim.api.nvim_set_keymap("v", key, command, { noremap = true })
end

function M.imap(key, command)
    vim.api.nvim_set_keymap("v", key, command, { noremap = false })
end

function M.tmap(key, command)
    vim.api.nvim_set_keymap("t", key, command, { noremap = false })
end

function M.bufmap(key, command)
    vim.api.nvim_buf_set_keymap(vim.fn.bufnr(), "n", key, command, { noremap = true, silent = true })
end

function M.bufvmap(key, command)
    vim.api.nvim_buf_set_keymap(vim.fn.bufnr(), "n", key, command, { noremap = true, silent = true })
end

return M
