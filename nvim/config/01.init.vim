" ----------------------------------------------------------------------------
"  Basic editor configuration
" ----------------------------------------------------------------------------
syntax on
set number
set tabstop=4
set shiftwidth=4
set expandtab

autocmd BufWritePre *.py,*.java,*.js,*.rs,*.go,*.c,*.tex,*.cls FixWhitespace
au BufNewFile,BufRead *.cls set filetype=tex

:let mapleader = ","
:imap jk <Esc>
:set mouse=nicr

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
"  Cursor Setup
" ----------------------------------------------------------------------------
" Change cursor shape between insert and normal mode in iTerm2.app
"if $TERM_PROGRAM =~ "iTerm"
"    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"endif
":let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ----------------------------------------------------------------------------
"  Appearance
" ----------------------------------------------------------------------------
set background=dark
colorscheme gruvbox
