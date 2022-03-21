local M = {}

function M.config()
    require("go").setup({
        goimport = "gopls", -- goimport command, can be gopls[default] or goimport
        gofmt = "gofumpt", --gofmt cmd,
        max_line_len = 120, -- max line length in goline format
        tag_transform = false, -- tag_transfer  check gomodifytags for details
        test_template = "", -- default to testify if not set; g:go_nvim_tests_template  check gotests for details
        test_template_dir = "", -- default to nil if not set; g:go_nvim_tests_template_dir  check gotests for details
        comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
        verbose = false, -- output loginf in messages
        lsp_cfg = false, -- true: apply go.nvim non-default gopls setup, if it is a list, will merge with gopls setup e.g.
        -- lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = false, -- if a on_attach function provided:  attach on_attach function to gopls
        -- true: will use go.nvim on_attach if true
        -- nil/false do nothing
        lsp_codelens = false, -- set to false to disable codelens, true by default
        gopls_remote_auto = false, -- add -remote=auto to gopls
        gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile",
        fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls "/var/log/gopls.log" }
        lsp_diag_hdlr = true, -- hook lsp diag handler

        dap_debug = false, -- set to false to disable dap
        dap_debug_keymap = true, -- set keymaps for debugger
        dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
        dap_debug_vt = true, -- set to true to enable dap virtual text
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
