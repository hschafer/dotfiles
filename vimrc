" ----------------------------------------------------------------------------
"  Setup for vundle
" ----------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" Use :PluginInstall to set things up
call vundle#begin()

Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'Shougo/deoplete.nvim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'digitaltoad/vim-pug'
Plugin 'easymotion/vim-easymotion'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'gerw/vim-latex-suite'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Bundle 'low-ghost/nerdtree-fugitive'
Plugin 'mikelue/vim-maven-plugin'
Plugin 'morhetz/gruvbox'
Bundle "myusuf3/numbers.vim"
Plugin 'neomake/neomake'
Plugin 'racer-rust/vim-racer'
Plugin 'rizzatti/dash.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'timonv/vim-cargo'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-latex/vim-latex'
Plugin 'vimlab/split-term.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'zchee/deoplete-jedi'

call vundle#end()
filetype plugin indent on

" ----------------------------------------------------------------------------
"  Basic vim setup
" ----------------------------------------------------------------------------
:let mapleader = ","
:imap jk <Esc>

" ----------------------------------------------------------------------------
"  Coding Shit
" ----------------------------------------------------------------------------
syntax on
set relativenumber
set number
set tabstop=4
set shiftwidth=4
set expandtab

"autocmd BufWritePre *.h, *.c, *.cpp, *.py, *.js, *.html, *.css, *.java, *.cls, *.tex FixWhitespace
autocmd BufWritePre *.py,*.java FixWhitespace
au BufNewFile,BufRead *.cls set filetype=tex

" ----------------------------------------------------------------------------
"  Moving around, tabs, windows and buffers
" ----------------------------------------------------------------------------

" Terminal mode
:tnoremap <Esc> <C-\><C-n>
":tnoremap <C-h> <C-\><C-n><C-w>h
":tnoremap <C-j> <C-\><C-n><C-w>j
":tnoremap <C-k> <C-\><C-n><C-w>k
":tnoremap <C-l> <C-\><C-n><C-w>l

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Search shortcuts
map <c-space> ?
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
nnoremap <Leader>l :ls<CR>
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
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ----------------------------------------------------------------------------
"  Appearance
" ----------------------------------------------------------------------------
syntax enable

set background=dark
colorscheme gruvbox

" ----------------------------------------------------------------------------
"  NERDTree
" ----------------------------------------------------------------------------
map <Leader>n <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\.class', '\.o']

" ----------------------------------------------------------------------------
"  Vim Airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2  " To appear by default
set noshowmode    " Hide statusline

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#quickfix#enabled = 1

"let g:airline_section_warning .=
"	\ '%{neomake#statusline#LoclistStatus()}'.
"	\ 'qf: %{neomake#statusline#QflistStatus()}'

" ----------------------------------------------------------------------------
"  Easy Motion
" ----------------------------------------------------------------------------
map <space> <Plug>(incsearch-easymotion-/)
map <Leader>/ <Plug>(incsearch-easymotion-/)
map <Leader>? <Plug>(incsearch-easymotion-?)
map <Leader>g/ <Plug>(incsearch-easymotion-stay)


" ----------------------------------------------------------------------------
"  Syntastic
" ----------------------------------------------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height=4
"
"" Because neomake does a better job at rust
"let g:syntastic_rust_checkers = []

" ----------------------------------------------------------------------------
"  Deoplete
" ----------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1

" ----------------------------------------------------------------------------
"  Omnifunc
" ----------------------------------------------------------------------------
set omnifunc=syntaxcomplete#Complete
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" ----------------------------------------------------------------------------
"  Some vim-racer
" ----------------------------------------------------------------------------
set hidden
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/usr/local/rust/rustc-1.11.0/src"

" ----------------------------------------------------------------------------
"  Neomake
" ----------------------------------------------------------------------------
" Neomake configuration.
"augroup vimrc_neomake
"  autocmd BufWritePost * Neomake
"augroup END
map <Leader>m :Neomake<cr>


let g:neomake_verbose = 0
"let g:neomake_logfile = "neo.log"
let g:neomake_list_height = 4
let g:neomake_open_list = 2  " So it doesn't jump down to Quickfix
let g:neomake_airline = 1

" ----------------------------------------------------------------------------
"  Auto compiler
" ----------------------------------------------------------------------------
autocmd BufRead Cargo.toml,Cargo.lock,*.rs compiler cargo

" ----------------------------------------------------------------------------
"  Vim-Notes
" ----------------------------------------------------------------------------
:let g:notes_directories = [
    \ '~/Documents/Notes',
    \ '~/Documents/UW/143_16au/notes',
    \ '~/Documents/UW/143_17wi/notes',
    \ '~/Documents/UW/143_17sp/notes',
    \ '~/Documents/UW/461/notes',
    \ '~/Documents/UW/401/notes',
    \ '~/Documents/UW/521/notes']
:let g:notes_suffix = '.txt'

" ----------------------------------------------------------------------------
"  Vim Markdown
" ----------------------------------------------------------------------------
let vim_markdown_preview_hotkey='<C-m>'


" ----------------------------------------------------------------------------
"  Run directory specific vim settings
" ----------------------------------------------------------------------------
if filereadable(".vim.custom")
    so .vim.custom
endif
