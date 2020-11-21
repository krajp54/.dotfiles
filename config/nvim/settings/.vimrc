set encoding=utf-8
scriptencoding utf-8

" * Global Settings for vim

set number
set mouse=a
set numberwidth=1
set clipboard=unnamedplus
set showcmd
set ruler
set showmatch
set sw=4
set ts=4
set expandtab
set smartindent
set relativenumber
set laststatus=2
set noshowmode
set updatetime=100
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set showtabline=2
" set nocompatible

syntax enable

" Establish the key leader
let mapleader=' '

" Support for Python3
let g:python3_host_prog='/usr/bin/python'

" Load the settings files
so ~/.config/nvim/settings/plugs.vim
so ~/.config/nvim/settings/plug-config.vim
so ~/.config/nvim/settings/keys.vim
