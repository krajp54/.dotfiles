set number
set mouse=a

" * Width for the number in the left ruler
" set numberwidth=3

set clipboard=unnamedplus
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=4
set relativenumber
set laststatus=2
set noshowmode

syntax enable

call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'

" * IDE
" Easymotion
Plug 'easymotion/vim-easymotion'

" NerdTree
Plug 'scrooloose/nerdtree'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

" * Settings for the pluggins
" Establish the theme and its settings
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"

" Establish the key leader to call functions of plugins
let mapleader=" "

" Key binding for the function in Easymotion
" Searches for two chars to jump in the text of the open file
nmap <Leader>s <Plug>(easymotion-s2)

" Settings for nerdtree
let NERDTreeQuitOnOpen=1
nmap <Leader>nt :NERDTreeFind<CR>

" * Custom Key Bindings
" Custom Write
nmap <Leader>w :w<CR>

" Custom Quit
nmap <Leader>q :q<CR>

