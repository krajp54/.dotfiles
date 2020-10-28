scriptencoding utf-8

" * Custom Key Bindings

" Key binding for the function in Easymotion
" Searches for two chars to jump in the text of the open file
nmap <Leader>s <Plug>(easymotion-s2)

" Keybinding for open NerdTree
nmap <Leader>nt :NERDTreeFind<CR>

" Custom Write
nmap <Leader>w :w<CR>

" Custom Quit
nmap <Leader>q :q<CR>

" Vertical Split
nmap <Leader>vs :vs<CR>

" Format the file
nmap <Leader>fc :Autoformat<CR>

" List all buffers
nmap <Leader><Tab> :Buffers<CR>

" Turn off highlighting until next search
nmap <Leader>no :noh<CR>

" Shortcut for Plug Install
nmap <Leader>pi :PlugInstall<CR>

" Shortcut for Plug Update
nmap <Leader>pu :PlugUpdate<CR>

" Git Status (Fugitive)
nmap <Leader>gi :Git<CR>

