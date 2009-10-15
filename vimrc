syn on

set autoindent
set smartindent

set ruler

set incsearch

filetype plugin on

autocmd BufNewFile *.h	TSkeletonSetup skeleton.h
autocmd BufNewFile *.c	TSkeletonSetup skeleton.c
autocmd BufNewFile *.cc	TSkeletonSetup skeleton.cc
autocmd BufNewFile *.pl	TSkeletonSetup skeleton.pl
autocmd BufNewFile *.pm	TSkeletonSetup skeleton.pm
