" " ----------------------------------------------------------------------------
" "  Easy Motion
" " ----------------------------------------------------------------------------
" map <space> <Plug>(incsearch-easymotion-/)
" map <Leader>/ <Plug>(incsearch-easymotion-/)
" map <Leader>? <Plug>(incsearch-easymotion-?)
" map <Leader>g/ <Plug>(incsearch-easymotion-stay)
" 
" 
" " ---------------------------------------------------------------------------
" "  Deoplete
" " ----------------------------------------------------------------------------
" let g:deoplete#enable_at_startup = 1
" 
" " ----------------------------------------------------------------------------
" "  Omnifunc
" " ----------------------------------------------------------------------------
" set omnifunc=syntaxcomplete#Complete
" autocmd FileType java setlocal omnifunc=javacomplete#Complete
" 
" " ----------------------------------------------------------------------------
" "  Some vim-racer
" " ----------------------------------------------------------------------------
" set hidden
" let g:racer_cmd = "racer"
" let $RUST_SRC_PATH="/usr/local/rust/rustc-1.11.0/src"
" 
" " ----------------------------------------------------------------------------
" "  Neomake
" " ----------------------------------------------------------------------------
" map <Leader>m :Neomake<cr>
" 
" 
" let g:neomake_verbose = 0
" let g:neomake_list_height = 4
" let g:neomake_open_list = 2  " So it doesn't jump down to Quickfix
" 
" " ----------------------------------------------------------------------------
" "  Auto compiler
" " ----------------------------------------------------------------------------
" autocmd BufRead Cargo.toml,Cargo.lock,*.rs compiler cargo
" 
" " ----------------------------------------------------------------------------
" "  Vim-Notes
" " ----------------------------------------------------------------------------
" :let g:notes_directories = [
"     \ '~/notes',
"     \ '~/Documents/notes',
"     \ '~/Documents/UW/notes',
"     \ '~/Documents/UW/143_16au/notes',
"     \ '~/Documents/UW/143_17wi/notes',
"     \ '~/Documents/UW/143_17sp/notes',
"     \ '~/Documents/UW/143_17su/notes',
"     \ '~/Documents/Teaching/143/18au/notes',
"     \ '~/Documents/UW/390ha_17au/notes',
"     \ '~/Documents/UW/461/notes',
"     \ '~/Documents/UW/401/notes',
"     \ '~/Documents/UW/416/notes',
"     \ '~/Documents/UW/451/notes',
"     \ '~/Documents/UW/473/notes',
"     \ '~/Documents/UW/546/notes',
"     \ '~/Documents/UW/552/notes',
"     \ '~/Documents/UW/521/notes']
" :let g:notes_suffix = '.txt'
" 
" " ----------------------------------------------------------------------------
" "  vim-markdown
" " ----------------------------------------------------------------------------
" let g:vim_markdown_folding_disabled = 1
" 
" " ----------------------------------------------------------------------------
" "  Livedown
" " ----------------------------------------------------------------------------
" " should markdown preview get shown automatically upon opening markdown buffer
" let g:livedown_autorun = 1
" " should the browser window pop-up upon previewing
" let g:livedown_open = 1
" " the port on which Livedown server will run
" let g:livedown_port = 1337
" 
" " ----------------------------------------------------------------------------
" " vim markdown preview
" " ----------------------------------------------------------------------------
" let vim_markdown_preview_github=1
" let vim_markdown_preview_browser='Google Chrome'
" let g:livepreview_previewer = 'open -a Skim'
" let g:livepreview_engine = 'lualatex'
" 
" " ----------------------------------------------------------------------------
" " Surround
" " ----------------------------------------------------------------------------
" if exists('g:loaded_surround')
"     " vim-surround: q for `foo' and Q for ``foo''
"     let b:surround_{char2nr('q')} = "`\r'"
"     let b:surround_{char2nr('Q')} = "``\r''"
" endif
" 
" " ----------------------------------------------------------------------------
" "  Snippets
" " ----------------------------------------------------------------------------
" 
" " From https://github.com/Shougo/neosnippet.vim
" " Plugin key-mappings.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
" 
" " SuperTab like snippets behavior.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" "imap <expr><TAB>
" " \ pumvisible() ? "\<C-n>" :
" " \ neosnippet#expandable_or_jumpable() ?
" " \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" 
" " For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=nc
" endif
" 
" 
" " ----------------------------------------------------------------------------
" "  Run directory specific vim settings
" " ----------------------------------------------------------------------------
" if filereadable(".vim.custom")
"     so .vim.custom
" endif
