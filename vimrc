" ----------------------------------------------------------------------------
"  Setup for vundle
" ----------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" Use :PluginInstall to set things up
call vundle#begin()

Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'


call vundle#end()           
filetype plugin indent on


" ----------------------------------------------------------------------------
"  Basic vim setup
" ----------------------------------------------------------------------------
:let mapleader = ","

" ----------------------------------------------------------------------------
"  Coding Shit
" ----------------------------------------------------------------------------
syntax on

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" ----------------------------------------------------------------------------
"  Moving around, tabs, windows and buffers
" ----------------------------------------------------------------------------
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" ----------------------------------------------------------------------------
"  Solarized
" ----------------------------------------------------------------------------
syntax enable
set background=dark
colorscheme solarized

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

" ----------------------------------------------------------------------------
"  Easy Motion
" ----------------------------------------------------------------------------
map  <Leader>/ <Plug>(easymotion-bd-f)

" ----------------------------------------------------------------------------
"  You Complete Me
" ----------------------------------------------------------------------------
let g:ycm_autoclose_preview_window_after_completion=1
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" ----------------------------------------------------------------------------
"  Syntastic
" ----------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
