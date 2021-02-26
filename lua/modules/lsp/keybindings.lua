local keymap = vim.api.nvim_set_keymap

function _G.show_documentation()
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.cmd('h ' .. vim.fn.expand('<cword>'))
    else
        vim.cmd('lua require("lspsaga.hover").render_hover_doc()')
    end
end

keymap('n', 'K',         '<CMD>lua show_documentation()<CR>',                                     { noremap = true, silent = true})
keymap('n', '<C-j>',     '<CMD>lua require("lspsaga.hover").smart_scroll_hover(1)<CR>',           { noremap = true, silent = true})
keymap('n', '<C-k>',     '<CMD>lua require("lspsaga.hover").smart_scroll_hover(-1)<CR>',          { noremap = true, silent = true})
keymap('n', 'ga',        '<CMD>lua require("lspsaga.codeaction").code_action()<CR>',              { noremap = true, silent = true})
keymap('v', 'ga',        '<CMD>\'<,\'>lua require("lspsaga.codeaction").code_action()<CR>',       { noremap = true, silent = true})
keymap('n', 'gd',        '<CMD>lua require("lspsaga.provider").preview_definition()<CR>',         { noremap = true, silent = true})
keymap('n', 'gD',        '<CMD>lua vim.lsp.util.show_line_diagnostics()<CR>',                     { noremap = true, silent = true})
keymap('n', '[e',        '<CMD>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', { noremap = true, silent = true})
keymap('n', ']e',        '<CMD>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', { noremap = true, silent = true})
keymap('n', 'gr',        '<CMD>lua require("lspsaga.rename").rename()<CR>',                       { noremap = true, silent = true})
keymap('n', '<leader>F', '<CMD>lua vim.lsp.buf.formatting()<CR>',                                 { noremap = true, silent = true})
