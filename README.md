# NeoVim File Configuration

## Preview

![Text Editor](https://raw.githubusercontent.com/mnabila/nvimrc/master/preview/preview-1.png)
![File Manager](https://raw.githubusercontent.com/mnabila/nvimrc/master/preview/preview-2.png)
![Fuzzy Finder](https://raw.githubusercontent.com/mnabila/nvimrc/master/preview/preview-3.png)

## Instalation

### Installing Dependency

> archlinux with yay package manager

```
$ yay -S git neovim-git nodejs npm yarn python-pynvim neovim-remote the_silver_searcher bat prettier
```

optional dependency

> python

```
$ yay -S python-black python-pylint python-jedi python-pipenv python-pydocstyle
```

> latex

```
$ yay -S texlive-most texlab
```

> bash

```
$ yay -S shfmt
```

> cpp

```
$ yay -S clang
```

> lua

```
$ yay -S lua-format
```

### Installing Configuration

```
$ git clone https://github.com/mnabila/nvimrc ~/.config/nvim
```

```
$ nvim +PackerInstall
```

### Plugins

|    Function    | Plugins                                                                                                   |
| :------------: | --------------------------------------------------------------------------------------------------------- |
| Plugin Manager | [packer.nvim](https://github.com/wbthomason/packer.nvim)                                                  |
|  File Manager  | [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua)                                              |
|  Status line   | [DIY](https://github.com/mnabila/nvimrc/tree/master/lua/modules/statusline)                               |
|  Colorscheme   | [gruvbox](https://github.com/morhetz/gruvbox) and [gruvbox8](https://github.com/lifepillar/vim-gruvbox8)  |
|      Icon      | [Nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)                                      |
|      Git       | [vim fugitive](https://github.com/tpope/vim-fugitive) [vim-signify](https://github.com/mhinz/vim-signify) |
| Auto Complete  | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                                |
|     Others     | [packer/init](https://github.com/mnabila/nvimrc/blob/master/lua/modules/packer/init.lua)                       |
