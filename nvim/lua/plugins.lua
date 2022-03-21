return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Other packages
  use 'bronson/vim-trailing-whitespace'
  use 'flazz/vim-colorschemes'
  use 'jeetsukumaran/vim-buffergator'
  use 'lervag/vimtex'
  use 'mattn/emmet-vim'
  use 'morhetz/gruvbox'
  use {
      'neoclide/coc.nvim', branch = 'release'
  }
  use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'scrooloose/nerdcommenter'
  use 'scrooloose/nerdtree'
  use 'Shougo/neosnippet-snippets'
  use 'Shougo/neosnippet.vim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
end)
