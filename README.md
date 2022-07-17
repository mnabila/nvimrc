# NeoVim File Configuration

## Preview

![Text Editor](./preview/preview-1.png)

## Instalation

### Installing Configuration

```
$ git clone https://github.com/mnabila/nvimrc ~/.config/nvim
```

before execute PackerInstall, make sure you change `installMode` to `true` in init.lua, after finish installation revert to false.
if `installMode` value is `true` all configuration in this nvimrc not loaded

```
$ nvim +PackerInstall
```

> > **Note:** Makesure [packer.nvim](https://github.com/wbthomason/packer.nvim/) was installed

### Plugins

|    Function    | Plugins                                                              |
| :------------: | -------------------------------------------------------------------- |
| Plugin Manager | [packer.nvim](https://github.com/wbthomason/packer.nvim/)            |
|  File Manager  | [neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)           |
|  Status line   | [feline.nvim](https://github.com/feline-nvim/feline.nvim)            |
|  Buffer line   | [nvim-cokeline](https://github.com/noib3/nvim-cokeline)              |
|  Colorscheme   | [gruvboy.nvim](https://github.com/mnabila/gruvboy.nvim)              |
|      Icon      | [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) |
|      Git       | [gitsign](https://github.com/lewis6991/gitsigns.nvim)                |
| Auto Complete  | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)                      |
|     Others     | [configs/packer](./lua/configs/packer/init.lua)                      |

## License

Source is available under the [Mit License](https://github.com/mnabila/nvimrc/blob/master/LICENSE)
