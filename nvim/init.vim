" First install plugins
lua require('plugins')

" Then run the rest of the init files
for f in split(glob('~/.config/nvim/config/*.vim'), '\n')
    exe 'source' f
endfor
