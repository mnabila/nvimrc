local keymap = vim.api.nvim_set_keymap

function check_backspace()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- lsp actions
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })
keymap('n', 'gA', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
keymap('n', 'gD', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', { noremap = true, silent = true })
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap = true, silent = true })
keymap('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<CR>', { noremap = true, silent = true })
keymap('n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
keymap('v', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })
keymap('i', '<CR>', '<CR><CR><C-o>k<Tab>', { noremap = true, silent = true })
keymap('i', '<c-space>', '<Plug>(completion_trigger)', { noremap = false, silent = true })

keymap(
  'i', '<Tab>',
  'pumvisible() ? "<C-n>" : v:lua.check_backspace() ? "<Tab>" : completion#trigger_completion()',
  { noremap = true, expr = true }
)

keymap('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', { noremap = true, expr = true })
