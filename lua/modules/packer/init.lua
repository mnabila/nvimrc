vim.cmd('packadd packer.nvim')

local packer = require('packer')

packer.init({
    display = {
        open_cmd = 'leftabove 80vnew [packer]',
    }
})

packer.startup(function()
    use { 'wbthomason/packer.nvim', opt = true }

    use 'glepnir/indent-guides.nvim'
    use 'junegunn/vim-easy-align'
    use 'mnabila/vim-header'
    use 'nanotee/sqls.nvim'
    use 'psliwka/vim-smoothie'
    use 'rrethy/vim-hexokinase'
    use 'tpope/vim-surround'
    use 'voldikss/vim-translator'
    use 'windwp/nvim-autopairs'
    use 'terrortylor/nvim-comment'

    use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install'}

    -- file namager
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

    -- buffer list
    use { 'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

    -- git
    use { 'mattn/gist-vim', requires = { 'mattn/webapi-vim' } }
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

    -- colorsceme
    use { 'morhetz/gruvbox', disable = true }
    use { 'lifepillar/vim-gruvbox8', disable = false }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' , requires = { 'p00f/nvim-ts-rainbow' }}

    -- nvim-lsp
    use {
        'neovim/nvim-lspconfig',
        requires = {
            'glepnir/lspsaga.nvim',
            'onsails/lspkind-nvim'
        }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-fzy-native.nvim'
        }
    }
    use { 'hrsh7th/nvim-compe', requires = { 'hrsh7th/vim-vsnip' } }

    -- code formatter
    use 'lukas-reineke/format.nvim'

    -- snippet
    use 'mattn/emmet-vim'

    -- statusline
    use { 'glepnir/galaxyline.nvim', branch = 'main', requires = {'kyazdani42/nvim-web-devicons'}
}

end)

return packer
