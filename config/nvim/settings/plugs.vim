scriptencoding utf-8

" * Plugins
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'rakr/vim-one'

" Icons for NerdTree
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" * IDE

" Easymotion
Plug 'easymotion/vim-easymotion'

" NerdTree
Plug 'scrooloose/nerdtree'

" Tmux Navigator
Plug 'christoomey/vim-tmux-navigator'

" Autoformat
" Plug 'Chiel92/vim-autoformat'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'sbdchd/neoformat'

" fzf VIM
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" Fugitive
Plug 'tpope/vim-fugitive'

" GitGutter
Plug 'airblade/vim-gitgutter'

" Syntastic
Plug 'vim-syntastic/syntastic'

" NerdCommenter
Plug 'preservim/nerdcommenter'

" Better-Comments
Plug 'jbgutierrez/vim-better-comments'

" Autopairs
Plug 'jiangmiao/auto-pairs'

" CoC (Completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autoclose tags
Plug 'alvan/vim-closetag'

" Use NerdFonts in Vim
Plug 'lambdalisue/nerdfont.vim'

" Highlight syntaxis
Plug 'sheerun/vim-polyglot'

" Indent lines
Plug 'Yggdroot/indentLine'

call plug#end()

