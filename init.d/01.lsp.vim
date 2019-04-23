" lsp configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set omnifunc=LanguageClient#complete
" set completefunc=LanguageClient#complete
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()

" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_autoStop = 1
" let g:LanguageClient_diagnosticsEnable = 1
" let g:LanguageClient_hoverPreview = 'Never'
" let g:LanguageClient_serverStderr = '/tmp/LanguageServer.log'
" let g:LanguageClient_settingsPath = '~/.config/nvim/lspSettings.json' "https://github.com/autozimu/LanguageClient-neovim/issues/448
" let g:LanguageClient_useVirtualText = 0
" let g:LanguageClient_loggingLevel = 'ERROR'
" let g:LanguageClient_loggingFile = '/tmp/LanguageClient.log'

" let g:LanguageClient_serverCommands = {
"       \ 'c': ['ccls', '--log-file=/tmp/cc.log'],
"       \ 'cpp': ['ccls', '--log-file=/tmp/cc.log'],
"       \ 'css': ['css-languageserver', '--stdio'],
"       \ 'cuda': ['ccls', '--log-file=/tmp/cc.log'],
"       \ 'html': ['html-languageserver', '--stdio'],
"       \ 'javascript': ['typescript-language-server', '--stdio'],
"       \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
"       \ 'json': ['json-languageserver', '--stdio'],
"       \ 'less': ['css-languageserver', '--stdio'],
"       \ 'objc': ['ccls', '--log-file=/tmp/cc.log'],
"       \ 'php': ['intelephense', '--stdio'],
"       \ 'python': ['python', '-m', 'pyls'],
"       \ 'sass': ['css-languageserver', '--stdio'],
"       \ 'scss': ['css-languageserver', '--stdio'],
"       \ 'sh': ['bash-language-server', 'start'],
"       \ 'typescript': ['typescript-language-server', '--stdio'],
"       \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
"       \ 'yaml': ['yaml-language-server', '--stdio'],
"       \ }
" let g:LanguageClient_diagnosticsDisplay = {
"       \  1: {
"       \      'name': 'Error',
"       \      'texthl': 'ALEError',
"       \      'signText': 'EE',
"       \      'signTexthl': 'ALEErrorSign',
"       \  },
"       \  2: {
"       \      'name': 'Warning',
"       \      'texthl': 'ALEWarning',
"       \      'signText': 'WW',
"       \      'signTexthl': 'ALEWarningSign',
"       \  },
"       \  3: {
"       \      'name': 'Information',
"       \      'texthl': 'ALEInfo',
"       \      'signText': 'II',
"       \      'signTexthl': 'ALEInfoSign',
"       \  },
"       \  4: {
"       \      'name': 'Hint',
"       \      'texthl': 'ALEInfo',
"       \      'signText': 'HH',
"       \      'signTexthl': 'ALEInfoSign',
"       \  },
"       \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
