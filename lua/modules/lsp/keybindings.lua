local keymap = vim.api.nvim_set_keymap

function _G.show_documentation()
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    else
        vim.cmd('lua vim.lsp.buf.hover()')
    end
end

keymap('n', 'K', '<CMD>lua show_documentation()<CR>', {noremap = true, silent = true})
keymap('n', 'gA', '<CMD>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})
keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true})
keymap('n', 'gD', '<CMD>lua vim.lsp.util.show_line_diagnostics()<CR>', {noremap = true, silent = true})
keymap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', {noremap = true, silent = true})
keymap('n', 'gR', '<CMD>lua vim.lsp.buf.rename()<CR>', {noremap = true, silent = true})
keymap('n', '<leader>F', '<CMD>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
keymap('v', '<leader>F', '<CMD>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
