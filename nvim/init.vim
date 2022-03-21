" Run all of the init files
" Hard copies located in .dotfiles/nvim/config
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor
