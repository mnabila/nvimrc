# NeoVim File Configuration

## Instalation

```
$ git clone https://github.com/nabil48/nvimr ~/.config/nvim
```

#### Neovim

```Unix
curl -flo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
$ nvim +PlugInstall
```

#### Vim

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
$ vim +PlugInstall
```

## Plugin

<table>
  <thead>
    <tr>
      <td>Function</td>
      <td>Plugin</td>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Plugin Manager</td>
      <td><a href="https://github.com/junegunn/vim-plug" target="_blank">Vim Plug</a></td>
    </tr>
    <tr>
      <td>File Manager</td>
      <td><a href="https://github.com/scrooloose/nerdtree" target="_blank">Nerd Tree</a></td>
    </tr>
    <tr>
      <td>Status line</td>
      <td><a href="https://github.com/vim-airline/vim-airline" target="_blank">Vim Airline</a></td>
    </tr>
    <tr>
      <td>Color Scheme</td>
      <td><a href="https://github.com/morhetz/gruvbox" target="_blank">Gruvbox</a></td>
    </tr>
    <tr>
      <td>Icon</td>
      <td><a href="https://github.com/ryanoasis/vim-devicons" target="_blank">Vim Devicons</a></td>
    </tr>
    <tr>
      <td>Git</td>
      <td>
        <ul>
          <li><a href="https://github.com/tpope/vim-fugitive" target="_blank">Vim Fugitive</a></li>
          <li><a href="https://github.com/airblade/vim-gitgutter" target="_blank">Vim Gitgutter</a></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Auto Complete</td>
      <td>
        <a href="https://github.com/neoclide/coc.nvim" target="_blank">CoC.Nvim</a>
        <ul>
          <li><a href="https://github.com/neoclide/coc-css" target="_blank">coc-css</a></li>
          <li><a href="https://github.com/neoclide/coc-emmet" target="_blank">coc-emmet</a></li>
          <li><a href="https://github.com/neoclide/coc-html" target="_blank">coc-html</a></li>
          <li><a href="https://github.com/neoclide/coc-json" target="_blank">coc-json</a></li>
          <li><a href="https://github.com/neoclide/coc-phpls" target="_blank">coc-phpls</a></li>
          <li><a href="https://github.com/neoclide/coc-prettier" target="_blank">coc-prettier</a></li>
          <li><a href="https://github.com/neoclide/coc-python" target="_blank">coc-python</a></li>
          <li><a href="https://github.com/neoclide/coc-snippet" target="_blank">coc-snippet</a></li>
          <li><a href="https://github.com/neoclide/coc-tsserver" target="_blank">coc-tsserver</a></li>
          <li><a href="https://github.com/neoclide/coc-yaml" target="_blank">coc-yaml</a></li>
        </ul>
      </td>
    </tr>
    <tr>
      <td>Utility</td>
      <td>
        <ul>
          <li><a href="https://github.com/" target="_blank"></a></li>
          <li><a href="https://github.com/iamcco/markdown-preview.nvim" target="_blank">Markdown Preview</a></li>
          <li><a href="https://github.com/tpope/vim-unimpaired" target="_blank">Unimpaired</a></li>
          <li><a href="https://github.com/tpope/vim-surround" target="_blank">Surround</a></li>
          <li><a href="https://github.com/tpope/vim-commentary" target="_blank">Commentary</a></li>
          <li><a href="https://github.com/terryma/vim-multiple-cursors" target="_blank">Vim multiple cursors</a></li>
          <li><a href="https://github.com/junegunn/vim-easy-align" target="_blank">Vim easy align</a></li>
          <li><a href="https://github.com/junegunn/fzf.vim" target="_blank">FZF</a></li>
          <li><a href="https://github.com/jiangmiao/auto-pairs" target="_blank">Auto Pair</a></li>
          <li><a href="https://github.com/godlygeek/tabular" target="_blank">Tabular</a></li>
          <li><a href="https://github.com/ctrlpvim/ctrlp.vim" target="_blank">Ctrl P</a></li>
          <li><a href="https://github.com/KabbAmine/vCoolor.vim" target="_blank">Color Picker</a></li>
         <li><a href="https://github.com/Chiel92/vim-autoformat" target="_blank">Auto Format</a></li> 
         <li><a href="https://github.com/majutsushi/tagbar" target="_blank">Tag Bar</a></li> 
         <li><a href="https://github.com/mhinz/vim-startify" target="_blank">Startify</a></li> 
         <li><a href="https://github.com/nathanaelkane/vim-indent-guides" target="_blank">Vim Indent Guides</a></li> 
        </ul>
      </td>
    </tr>
    <tr>
      <td>Language Pack</td>
      <td>
        <ul>
          <li><a href="https://github.com/sheerun/vim-polyglot" target="_blank">Vim Polygot</a></li>
          <li><a href="https://github.com/honza/vim-snippets" target="_blank">Vim Snippets</a></li>
          <li><a href="https://github.com/cakebaker/scss-syntax.vim" target="_blank">Scss syntax</a></li>
          <li><a href="https://github.com/mattn/emmet-vim" target="_blank">Emmet</a></li>
          <li><a href="https://github.com/plasticboy/vim-markdown" target="_blank">Vim Markdown</a></li>
          <li><a href="https://github.com/iamcco/mathjax-support-for-mkdp" target="_blank">Mathjax support</a></li>
          <li><a href="https://github.com/Glench/Vim-Jinja2-Syntax" target="_blank">Jinja2 syntax</a></li>
          <li><a href="https://github.com/Shougo/neco-vim" target="_blank">Neco vim</a></li>
          <li><a href="https://github.com/neoclide/coc-neco" target="_blank">Coco neco</a></li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>