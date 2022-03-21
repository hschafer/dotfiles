" ----------------------------------------------------------------------------
"  NeoBundle setup
" ----------------------------------------------------------------------------

"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/Hunter/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/Hunter/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'jeetsukumaran/vim-buffergator'
NeoBundle 'lervag/vimtex'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'morhetz/gruvbox'
NeoBundle 'neoclide/coc.nvim', 'release'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'


" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
"Everything else below is configuration for plugins

" ----------------------------------------------------------------------------
"  NERDTree
" ----------------------------------------------------------------------------
" map <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap ,n :NERDTreeFind<CR>
let NERDTreeIgnore=['\.pyc$', '\.class', '\.o']

" ----------------------------------------------------------------------------
"  Vim Airline
" ----------------------------------------------------------------------------
let g:airline_powerline_fonts = 1
set laststatus=2  " To appear by default

let g:airline_theme='gruvbox'

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#quickfix#enabled = 1

" let g:airline_section_warning .=
"   \ '%{neomake#statusline#LoclistStatus()}'.
"	\ 'qf: %{neomake#statusline#QflistStatus()}'

" ----------------------------------------------------------------------------
"  Jedi
" ----------------------------------------------------------------------------
let g:jedi#usages_command = "gu"


" ----------------------------------------------------------------------------
"  Latex
" ----------------------------------------------------------------------------
let g:tex_flavor = 'lualatex'
let g:vimtex_view_method = "skim"
let g:vimtex_view_general_viewer
            \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:vimtex_compiler_progname = 'lualatex'
