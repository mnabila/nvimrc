vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    use 'Yggdroot/indentLine'
    use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    use 'cohama/lexima.vim'
    use 'junegunn/vim-easy-align'
    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}}
    use {'romgrk/barbar.nvim', requires = {'kyazdani42/nvim-web-devicons'}}
    use {'mattn/gist-vim', requires = {'mattn/webapi-vim'}}
    use 'mhinz/vim-signify'
    use 'mnabila/vim-header'
    use 'morhetz/gruvbox'
    use 'psliwka/vim-smoothie'
    use 'rrethy/vim-hexokinase'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'voldikss/vim-translator'

    -- nvim-lsp
    use 'neovim/nvim-lspconfig'
    use {'nvim-telescope/telescope.nvim', requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}}
    use 'lukas-reineke/format.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'hrsh7th/nvim-compe', requires = { 'hrsh7th/vim-vsnip', 'hrsh7th/vim-vsnip-integ' }}
end)
