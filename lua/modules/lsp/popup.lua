local saga = require('lspsaga')

local opts = {
    -- error_sign              = ' ',
    -- warn_sign               = ' ',
    -- hint_sign               = ' ',
    -- infor_sign              = ' ',
    code_action_icon        = ' ',
    finder_definition_icon  = '  ',
    finder_reference_icon   = '  ',
    definition_preview_icon = '  ',
    border_style            = 1,
    rename_prompt_prefix    = '❱❱',
}

saga.init_lsp_saga(opts)
