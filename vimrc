" ~/.vimrc from Jose Luis Rivas <ghostbar@debian.org>

" Basic setup
syn on

" Set title on X window
set title

" Indentation
set autoindent
set smartindent

" Use 4-spaces instead of tabs
" set expandtab
set tabstop=4
set shiftwidth=4

" When I'm pasting activate this mode so autoindent doesn't smash all.
set pastetoggle=<F2>

" show ruler
set ruler

" Search related stuff
" use incremental search
set incsearch
set ignorecase     " Do case insensitive matching
set smartcase      " Do smart case matching

" Adding support for markdown syntax
augroup mkd
    autocmd BufRead *.mkd,*.md,*.markdown  set ts=2 sw=2 ai formatoptions=tcroqn2 comments=n:>
augroup END

" Load identation rules according to filetype
if has("autocmd")
  filetype plugin indent on
endif


" TSkeleton setup
"autocmd BufNewFile *.h	TSkeletonSetup skeleton.h
"autocmd BufNewFile *.c	TSkeletonSetup skeleton.c
"autocmd BufNewFile *.cc	TSkeletonSetup skeleton.cc
"autocmd BufNewFile *.pl	TSkeletonSetup skeleton.pl
"autocmd BufNewFile *.pm	TSkeletonSetup skeleton.pm

filetype plugin on

" Copying some rules from /etc/vimrc that are commented
set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set autowrite      " Automatically save before commands like :next and :make
set hidden         " Hide buffers when they are abandoned
set mouse=a        " Enable mouse usage (all modes)
