scriptencoding utf-8

" * Plugins
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" IDE

" Easymotion
Plug 'easymotion/vim-easymotion'

" NerdTree
Plug 'scrooloose/nerdtree'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" Autoformat
Plug 'Chiel92/vim-autoformat'

" fzf VIM
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Lightline
Plug 'itchyny/lightline.vim'

" Fugitive
Plug 'tpope/vim-fugitive'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Syntastic
Plug 'vim-syntastic/syntastic'

" NerdCommenter
Plug 'preservim/nerdcommenter'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" CoC (Completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

