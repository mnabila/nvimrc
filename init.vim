for f in split(glob('~/.config/nvim/init.d/*.vim'), '\n')
    exe 'source' f
endfor

