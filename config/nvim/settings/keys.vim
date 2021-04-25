scriptencoding utf-8

" * Custom Key Bindings

" Key binding for the function in Easymotion
" Searches for two chars to jump in the text of the open file
nmap <Leader>s <Plug>(easymotion-s2)

" Keybinding for open NerdTree
nmap <Leader>nt :NERDTreeFind<CR>

" Custom Write
nmap <Leader>w :wall<CR>

" Custom Quit
nmap <Leader>q :q<CR>

" Vertical Split
nmap <Leader>vs :vs<CR>

" Custom Map ':'
nmap ; :

" Format the file
" nmap <Leader>fc :Autoformat<CR>
" nmap <Leader>fc <Plug>(Prettier)
nmap <Leader>fc :Neoformat<CR>

" List all buffers
nmap <Leader><Tab> :Buffers<CR>

" Search for files in the current project
nmap <Leader>fi :GFiles<CR>

" Delete the current buffer
nmap <Leader>bc :bdelete<CR>

" Turn off highlighting until next search
nmap <Leader>no :noh<CR>

" Shortcut for Plug Install
nmap <Leader>pi :PlugInstall<CR>

" Shortcut for Plug Update
nmap <Leader>pu :PlugUpdate<CR>

" Git Status (Fugitive)
nmap <Leader>gi :Git<CR>

" Disable warnings from Syntastic
nmap <Leader>x :lclose<CR>

" Keybindings for the bufferline
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" CoC
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definitio)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Kite (Completion)
if &filetype ==? 'javascript' || &filetype ==? 'python'
	inoremap <c-space> <C-x><C-u>
else
	inoremap <silent><expr> <c-space> coc#refresh()
endif

