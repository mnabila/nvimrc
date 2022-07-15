local M = {}

function M.config()
    require("go").setup({
        go = "go", -- go command, can be go[default] or go1.18beta1
        goimport = "gopls", -- goimport command, can be gopls[default] or goimport
        fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls
        gofmt = "gofumpt", --gofmt cmd,
        max_line_len = 120, -- max line length in goline format
        tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
        gotests_template = "", -- sets gotests -template parameter (check gotests for details)
        gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
        comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
        icons = { breakpoint = "🧘", currentpos = "🏃" }, -- setup to `false` to disable icons setup
        verbose = false, -- output loginf in messages
        lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
        -- false: do nothing
        -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
        --   lsp_cfg = {settings={gopls={matcher='CaseInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
        lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
        lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
        --      when lsp_cfg is true
        -- if lsp_on_attach is a function: use this function as on_attach function for gopls
        lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
        lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
        -- function(bufnr)
        --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
        -- end
        -- to setup a table of codelens
        lsp_diag_hdlr = true, -- hook lsp diag handler
        -- virtual text setup
        lsp_diag_virtual_text = { space = 0, prefix = "" },
        lsp_diag_signs = true,
        lsp_diag_update_in_insert = false,
        lsp_document_formatting = true,
        -- set to true: use gopls to format
        -- false if you want to use other formatter tool(e.g. efm, nulls)
        gopls_cmd = nil, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
        gopls_remote_auto = true, -- add -remote=auto to gopls
        dap_debug = false, -- set to false to disable dap
        dap_debug_keymap = true, -- true: use keymap for debugger defined in go/dap.lua
        -- false: do not use keymap in go/dap.lua.  you must define your own.
        dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
        dap_debug_vt = false, -- set to true to enable dap virtual text
        build_tags = "tag1,tag2", -- set default build tags
        textobjects = true, -- enable default text jobects through treesittter-text-objects
        test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`}
        verbose_tests = true, -- set to add verbose flag to tests
        run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
        -- float term recommand if you use richgo/ginkgo with terminal color
    })
end

return setmetatable({}, {
    __call = function()
        return M.config()
    end,
})
