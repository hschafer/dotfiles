" ----------------------------------------------------------------------------
"  Basic editor configuration
" ----------------------------------------------------------------------------

" Leaders and stuff
:let mapleader = ","
:imap jk <Esc>

nnoremap ; :

" Highlighting and formatting
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab

" Side scrolling
set nowrap
set sidescroll=1

" File types
autocmd BufWritePre *.py,*.java,*.js,*.rs,*.go,*.c,*.tex,*.cls FixWhitespace
au BufNewFile,BufRead *.cls set filetype=tex

" Other config
:set mouse=nicr
set visualbell "no sounds - from dbalatero

" Backups
set noswapfile
set nobackup
set nowritebackup


" ----------------------------------------------------------------------------
"  Neovim specific setup
" ----------------------------------------------------------------------------
set inccommand=nosplit
let g:python3_host_prog = '/Users/Hunter/opt/anaconda3/bin/python'

" ----------------------------------------------------------------------------
"  Moving around, tabs, windows and buffers
" ----------------------------------------------------------------------------

" Terminal mode
:tnoremap <Esc> <C-\><C-n>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Search shortcuts
map <silent> <leader><cr> :noh<cr>

" Better window default
set splitright
set splitbelow

" Simpler split commands
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Smart way to move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

augroup vimrc
    au VimEnter * unmap <C-j>
    au VimEnter * noremap <C-j> <C-w>j
augroup END

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Useful mappings for managing buffers
" nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>


" ----------------------------------------------------------------------------
"  Appearance
" ----------------------------------------------------------------------------
set background=dark
colorscheme gruvbox
