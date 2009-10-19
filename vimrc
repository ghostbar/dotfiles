" ~/.vimrc from Jose Luis Rivas <ghostbar AT debian.org>

" Basic setup
syn on

" Indentation
set autoindent
set smartindent

" Use 4-spaces instead of tabs
"set expandtab
set tabstop=4
set shiftwidth=4

" show ruler
set ruler

" use incremental search
set incsearch

"filetype plugin on

" Adding support for markdown syntax
augroup mkd
    autocmd BufRead *.mkd,*.md,*.markdown  set ai formatoptions=tcroqn2 comments=n:>
augroup END

" TSkeleton setup
"autocmd BufNewFile *.h	TSkeletonSetup skeleton.h
"autocmd BufNewFile *.c	TSkeletonSetup skeleton.c
"autocmd BufNewFile *.cc	TSkeletonSetup skeleton.cc
"autocmd BufNewFile *.pl	TSkeletonSetup skeleton.pl
"autocmd BufNewFile *.pm	TSkeletonSetup skeleton.pm

filetype plugin on
