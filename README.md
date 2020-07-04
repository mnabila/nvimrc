# NeoVim File Configuration

## Preview

![Neovim Preview](https://raw.githubusercontent.com/mnabila/nvimrc/master/preview.png)

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
$ yay -S ccls
```

### Installing Configuration

```
$ git clone https://github.com/mnabila/nvimrc ~/.config/nvim
```

```
curl -flo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
$ nvim +PlugInstall
```

### Plugins

|    Function    | Plugins                                                                                                              |
| :------------: | -------------------------------------------------------------------------------------------------------------------- |
| Plugin Manager | [vim-plug](https://github.com/junegunn/vim-plug)                                                                     |
|  File Manager  | [nerd tree](https://github.com/scrooloose/nerdtree)                                                                  |
|  Status line   | [lightline.vim](https://github.com/itchyny/lightline.vim/) [vim-airline](https://github.com/vim-airline/vim-airline) |
|  Colorscheme   | [gruvbox](https://github.com/morhetz/gruvbox)                                                                        |
|      Icon      | [vim-devicons](https://github.com/ryanoasis/vim-devicons)                                                            |
|      Git       | [vim fugitive](https://github.com/tpope/vim-fugitive) [vim gitgutter](https://github.com/airblade/vim-gitgutter)     |
| Auto Complete  | [coc.nvim](https://github.com/neoclide/coc.nvim)                                                                     |
|     Others     | [nvimrc](https://github.com/mnabila/nvimrc/blob/master/init.d/plugin.vim)                                            |
