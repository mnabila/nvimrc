require('modules.lsp.langserver')
require('modules.lsp.diagnostic')
require('modules.lsp.keybindings')

vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_virtual_text_prefix = '❰'
vim.g.completion_matching_ignore_case = 1


-- sad, this configuration not working on lsp-diagnostic
vim.cmd('call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError", "linehl": "NONE"})')
vim.cmd('call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning", "linehl" : "NONE"})')
vim.cmd('call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation", "linehl" : "NONE"})')
vim.cmd('call sign_define("LspDiagnosticsHintSign", {"text" : "", "texthl" : "LspDiagnosticsHint", "linehl" : "NONE"})')

-- attach completion-nvim and diagnostic for every filetype
vim.cmd('au BufEnter * lua require("completion").on_attach()')
