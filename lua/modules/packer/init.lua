local is_installed, packer = pcall(require, "packer")
local use = packer.use

if not is_installed then
    require("modules.packer.bootstrap")()
else
    packer.init({
        display = {
            open_cmd = "leftabove 80vnew [packer]",
            header_sym = "─",
        },
        profile = {
            enable = true,
            threshold = 1,
        },
    })

    packer.startup(function()
        local ui = require("modules.ui")
        local completion = require("modules.completion")
        local editor = require("modules.editor")

        use({ "wbthomason/packer.nvim" })

        use({
            "tweekmonster/startuptime.vim",
            cmd = "StartupTime",
        })

        use(completion.lsp())
        use(completion.cmp())
        use(completion.emmet())

        use(ui.bufferline())
        use(ui.statusline())
        use(ui.filemanager())
        use(ui.indentline())
        use(ui.telescope())
        use(ui.colorizer())
        use(ui.treesitter())
        use(ui.colorscheme())

        use(editor.aerial())
        use(editor.formatter())
        use(editor.comment())
        use(editor.gist())
        use(editor.gitsigns())
        use(editor.diagnostic())
        use(editor.header())
        use(editor.translator())
        use(editor.autopair())
        use(editor.surround())
        use(editor.sql())
        use(editor.markdown())
        use(editor.easyalign())
    end)
end
