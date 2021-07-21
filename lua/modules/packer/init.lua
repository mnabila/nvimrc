local is_installed, packer = pcall(require, "packer")

if not is_installed then
    local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        vim.fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd("packadd packer.nvim")
    end
else
    packer.init({
        display = {
            open_cmd = "leftabove 80vnew [packer]",
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,

            header_sym = "─",
        },
        profile = {
            enable = true,
            threshold = 1,
        },
    })
    require("modules.packer.plugins")
end
