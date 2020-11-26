vim.g.completion_auto_change_source = 1
vim.g.completion_enable_auto_hover = 1
vim.g.completion_enable_snippet = 1
vim.g.completion_enable_snippet = 'vim-vsnip'
vim.g.completion_enable_auto_signature = 1
vim.g.completion_enable_auto_paren = 1
vim.g.completion_matching_ignore_case = 1
vim.g.completion_sorting='none'


-- define an chain complete list
vim.g.completion_chain_complete_list = {
    default = {
        {complete_items = {'lsp', 'snippet', 'buffers', 'path'}},
        {complete_items = {'path'}, triggered_only = {'/'}},
        {mode = {'<c-p>'}},
        {mode = {'<c-n>'}},
    },
    string = {{complete_items = {'path'}, triggered_only = {'/'}}},
    comment = {},
}

-- set source priority on completion list
vim.g.completion_items_priority = {
    ['Buffers'] = 0,
    ['vim-vsnip'] = 0,
    ['File'] = 2,
    ['Treesitter'] = 4,
    ['Keyword'] = 5,
    ['Class'] = 6,
    ['Constant'] = 6,
    ['Interfaces'] = 6,
    ['Struct'] = 6,
    ['Variables'] = 7,
    ['Field'] = 8,
    ['Function'] = 8,
    ['Method'] = 10,
}
