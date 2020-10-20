vim.g.completion_enable_auto_hover = 0
vim.g.completion_auto_change_source = 1
vim.g.completion_trigger_on_delete = 1

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_virtual_text_prefix = '❰'
vim.g.completion_matching_ignore_case = 1

-- define an chain complete list
vim.g.completion_chain_complete_list = {
    default = {
        {complete_items = {'lsp', 'path', 'buffers'}},
        {complete_items = {'path'}, triggered_only = {'/'}},
        {mode = {'<c-p>'}},
        {mode = {'<c-n>'}},
    },
    string = {{complete_items = {'path'}, triggered_only = {'/'}}},
    comment = {},
}

vim.cmd(
    'call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError"})')
vim.cmd(
    'call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})')
vim.cmd(
    'call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})')
vim.cmd(
    'call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsHint"})')
