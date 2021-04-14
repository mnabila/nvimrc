vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = true,
    virtual_text = { spacing = 4, prefix = "❰" },
    underline = false,
    update_in_insert = true,
})

local opts = {
    error_sign = "▊",
    warn_sign = "▊",
    hint_sign = "▊",
    infor_sign = "▊",
    dianostic_header_icon = "   ",
    code_action_icon = " ",
    finder_definition_icon = "  ",
    finder_reference_icon = "  ",
    definition_preview_icon = "  ",
    border_style = 1,
    rename_prompt_prefix = "❱❱",
}

require("lspsaga").init_lsp_saga(opts)
