# NeoVim File Configuration

## Preview

![Text Editor](https://raw.githubusercontent.com/mnabila/nvimrc/master/preview/preview-4.png)
![File Manager](https://raw.githubusercontent.com/mnabila/nvimrc/master/preview/preview-5.png)
![Fuzzy Finder](https://raw.githubusercontent.com/mnabila/nvimrc/master/preview/preview-6.png)

## Instalation

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
|  Status line   | [galaxyline.lua](https://github.com/glepnir/galaxyline.nvim)                                              |
|  Colorscheme   | [gruvbox](https://github.com/morhetz/gruvbox) and [gruvbox8](https://github.com/lifepillar/vim-gruvbox8)  |
|      Icon      | [Nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)                                      |
|      Git       | [vim fugitive](https://github.com/tpope/vim-fugitive) [vim-signify](https://github.com/mhinz/vim-signify) |
| Auto Complete  | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)                                                |
|     Others     | [packer/init](https://github.com/mnabila/nvimrc/blob/master/lua/modules/packer/init.lua)                  |

### Installing Dependency

> archlinux with paru package manager

```
$ paru -S git neovim-git nodejs npm yarn python-pynvim neovim-remote the_silver_searcher bat prettier
```

#### required by language server protocol

> bashls

```
$ npm install -g bash-language-server
```

> clangd

```
$ paru -S clang
```

> cssls

```
$ npm install -g vscode-css-languageserver-bin
```

> dockerls

```
$ npm install -g dockerfile-language-server-nodejs
```

> gopls

```
$ paru -S gopls
```

> html

```
$ npm install -g vscode-html-languageserver-bin
```

> jedi_language_server

```
$ paru -S jedi-language-server
```

> jsonls

```
$ npm install -g vscode-json-languageserver
```

> jsonls

```
$ npm install -g vscode-json-languageserver
```

> sqls

```
$ paru -S sqls-git
```

> sumneko_lua

```
$ paru -S lua-language-server-git
```

> texlab

```
$ paru -S texlive-most texlab
```

> tsserver

```
$ npm install -g typescript typescript-language-server
```

> vimls

```
$ npm install -g vim-language-server
```

#### required by code formater

> bash

```
$ paru -S shfmt
```

> html, json, js

```
$ paru -S prettier
```

> lua

```
$ paru -S stylua-git
```

> python

```
$ paru -S python-black
```


## License 
Source is available under the [Mit License](https://github.com/mnabila/nvimrc/blob/master/LICENSE)
