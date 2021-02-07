vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.init({
    display = {
        open_cmd = 'leftabove 80vnew [packer]',
    }
})

packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use 'Yggdroot/indentLine'
    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }
    use 'junegunn/vim-easy-align'
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    use 'mnabila/vim-header'
    use 'psliwka/vim-smoothie'
    use 'rrethy/vim-hexokinase'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    -- use 'tpope/vim-unimpaired'
    use 'voldikss/vim-translator'
    use 'windwp/nvim-autopairs'

    -- git
    use { 'mattn/gist-vim', requires = { 'mattn/webapi-vim' } }
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- colorsceme
    use { 'morhetz/gruvbox', disable = true }
    use { 'lifepillar/vim-gruvbox8', disable = false }

    -- nvim-lsp
    use 'neovim/nvim-lspconfig'
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' } }
    use 'lukas-reineke/format.nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'hrsh7th/nvim-compe', requires = { 'hrsh7th/vim-vsnip' } }
    -- use { 'glepnir/lspsaga.nvim', requires = { 'neovim/nvim-lspconfig' } }

    -- snippet
    use 'mattn/emmet-vim'

end)

return packer
