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
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'joshdick/onedark.vim'
Plugin 'nordtheme/vim'

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

"autocmd FileType markdown,pandoc setlocal foldmethod=manual
autocmd FileType markdown,pandoc setlocal foldenable
autocmd FileType markdown,pandoc setlocal foldlevel=99
autocmd FileType markdown,pandoc setlocal nospell

" Fix code block syntax parsing
let g:pandoc#syntax#codeblocks#embeds#langs = ["python", "javascript", "bash", "html", "css"]

" Custom folding that ignores # inside code blocks
autocmd FileType pandoc,markdown setlocal foldmethod=expr
autocmd FileType pandoc,markdown setlocal foldexpr=MarkdownFoldLevel()

function! MarkdownFoldLevel()
    let line = getline(v:lnum)
    
    " Check if we're inside a code block
    let code_block = 0
    for i in range(1, v:lnum)
        if getline(i) =~ '^```'
            let code_block = !code_block
        endif
    endfor
    
    " Only fold on headers outside code blocks
    if !code_block && line =~ '^#\+'
        return ">" . len(matchstr(line, '^#\+'))
    else
        return "="
    endif
endfunction

" colorscheme onedark
colorscheme nord
