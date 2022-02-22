local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd("packadd packer.nvim")
end

local packer = require("packer")

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
    local ui = require("modules.packer.ui")
    local completion = require("modules.packer.completion")
    local editor = require("modules.packer.editor")

    use({ "wbthomason/packer.nvim" })

    use({
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    })

    use(completion.lsp())
    use(completion.cmp())
    use(completion.emmet())
    use(completion.autopair())
    use(completion.copilot())

    use(ui.colorscheme())
    use(ui.bufferline())
    -- use(ui.bufferlinetwo())
    use(ui.statusline())
    use(ui.filemanager())
    use(ui.indentline())
    use(ui.telescope())
    use(ui.colorizer())
    use(ui.treesitter())

    use(editor.aerial())
    use(editor.diagnostic())
    use(editor.comment())
    use(editor.gist())
    use(editor.gitsigns())
    use(editor.header())
    use(editor.translator())
    use(editor.surround())
    -- use(editor.sql())
    use(editor.easyalign())
    use(editor.golang())
    use(editor.glow())
    use(editor.filetype())
    use(editor.formatter())
    -- use(editor.norg())
end)
