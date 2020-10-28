scriptencoding utf-8

" * Settings for the pluggins

" Establish the theme and its settings
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Settings for NERDTree
let NERDTreeQuitOnOpen=1

" Settings for fzf
let g:fzf_layout = { 'window': { 'width' : 0.7, 'height': 0.6 } }

" Settings for lightline
let g:lightline = {
	    \ 	'colorscheme': 'srcery_drk',
	    \ 	'active': {
	    \	  'left': [ [ 'mode', 'paste' ],
	    \		    [ 'readonly', 'relativepath', 'modified'] ],
	    \	  'right': [ [ 'fileformat', 'fileencoding', 'filetype' ],
	    \		     [ 'gitbranch' ] ]
	    \ 	},
	    \ 	'inactive': {
	    \	  'right': [ [ 'filetype' ],
	    \		     [ 'line' ] ]
	    \ 	},
	    \ 	'component_function': {
	    \ 	  'gitbranch': 'FugitiveHead' 
	    \ 	},
	    \ 	'subseparator': {
	    \	  'left': '',
	    \	  'right': ''
	    \ 	}
	    \ }

" Fix Sign Background GitGutter
highlight! link SignColumn LineNr 

" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_vim_checkers = ['vint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_aggregating_errors = 1

" Settings for NERDCommenter
let g:NERDSpaceDelims = 1

" * Settings for Coc(Completion)
" Establish the Tab Key for completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

