set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandox-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set autoindent
set number
set ruler

let g:airline_powerline_fonts = 1
let g:NERDTreeWinSize = 60
let g:NERDTreeShowHidden = 1
set fillchars+=vert:│
hi VertSplit cterm=NONE

" Better markdown folding using expression method
autocmd FileType markdown,pandoc setlocal foldmethod=expr
autocmd FileType markdown,pandoc setlocal foldexpr=MarkdownFolds()
autocmd FileType markdown,pandoc setlocal foldenable
autocmd FileType markdown,pandoc setlocal foldlevel=1

function! MarkdownFolds()
    let line = getline(v:lnum)
    " Create folds for headers
    if line =~ '^#\{1\}'
        return '>1'
    elseif line =~ '^#\{2\}'
        return '>2'
    elseif line =~ '^#\{3\}'
        return '>3'
    elseif line =~ '^#\{4\}'
        return '>4'
    elseif line =~ '^#\{5\}'
        return '>5'
    elseif line =~ '^#\{6\}'
        return '>6'
    else
        return '='
    endif
endfunction
