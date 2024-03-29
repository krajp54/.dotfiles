scriptencoding utf-8

" * Settings for the pluggins

" Establish the theme and its settings
colorscheme tender
let g:gruvbox_contrast_dark = 'hard'

" Settings for NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

augroup oninitnt
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1

" Settings for fzf
let g:fzf_layout = { 'window': { 'width' : 0.7, 'height': 0.6 } }

" Settings for lightline
let g:lightline#bufferline#enable_nerdfont = 1

let g:lightline = {
			\	'colorscheme': 'darcula',
			\	'active': {
				\		'left': [ [ 'mode', 'paste' ],
				\				[ 'readonly', 'relativepath', 'modified'] ],
				\		'right': [ [ 'fileformat', 'fileencoding', 'filetype' ],
				\				 [ 'gitbranch' ], [ 'kitestatus' ] ]
				\	},
				\	'tabline':{
				\		'left': [ [ 'buffers' ] ],
				\		'right': [ [ 'close' ] ]
				\	},
				\	'inactive': {
					\		'right': [ [ 'filetype' ],
					\				 [ 'line' ] ]
					\	},
					\	'component_function': {
						\		'gitbranch': 'FugitiveHead',
						\		'kitestatus': 'kite#statusline'
						\	},
						\	'subseparator': {
							\		'left': '',
							\		'right': ''
							\	},
							\	'component_expand':{
							\		'buffers': 'lightline#bufferline#buffers'
							\	},
							\	'component_type':{
							\		'buffers': 'tabsel'
							\	},
							\	'component_raw':{
							\		'buffers': 1
							\	}
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
let g:syntastic_html_checkers = ['eslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['eslint']
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

augroup disable_coc
	autocmd FileType python let b:coc_suggest_disable = 1
	autocmd FileType javascript let b:coc_suggest_disable = 1
	autocmd FileType scss setl iskeyword+=@-@
augroup END

" Settings for closetag
let g:closetag_filenames = '*.html, *.xhtml, *.phtml, *.xml, *.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,xml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" Settings for Neoformat
" Autoformat on save
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_only_msg_on_error = 1

let g:neoformat_enabled_html = ['prettier']
let g:neoformat_enabled_js = ['prettier']
let g:neoformat_enabled_json = ['prettier']
let g:neoformat_enabled_ts = ['prettier']
let g:neoformat_enabled_xml = ['prettier']
let g:neoformat_enabled_css = ['prettier']
let g:neoformat_enabled_markdown = ['prettier']
let g:neoformat_enabled_python = ['autopep8']

" Settings for IndentLine
let g:indentLine_char = '¦'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_bufTypeExclude = ['help', 'terminal']

" Settings for Kite
let g:kite_supported_languages = ['javascript', 'python']

" Settings for Floaterm
let g:floaterm_shell = "zsh"
let g:floaterm_autoclose = 1
