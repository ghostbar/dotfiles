" ~/.vimrc from Jose Luis Rivas <ghostbar@debian.org>

" Activating pathogen
call pathogen#infect()

" Basic setup
syn on " syntax on always, I like colors.

" No vi-compatible mode
set nocp " This way things like modelines works out-of-box and more stuff

" Set title on X window
set title

" Indentation
set autoindent " Keep indentation from previous line
set smartindent " Automatically inserts indentation in some cases

" show ruler
set ruler

" Search related stuff
" use incremental search
set incsearch
set ignorecase     " Do case insensitive matching
set smartcase      " Do smart case matching


" Use 2-spaces instead of tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" When I'm pasting activate this mode so autoindent doesn't smash all.
set pastetoggle=<F2>

" Adding support for markdown syntax
"augroup mkd
"  autocmd BufRead *.mkd,*.md,*.markdown  set ts=2 sw=2 ai formatoptions=tcroqn2 comments=n:>
"augroup END

" Load identation rules according to filetype
if has("autocmd")
  filetype plugin indent on
endif

" CoffeeScript should use spaces instead of tabs
augroup coffee
	autocmd BufNewFile,BufRead *.coffee	set expandtab
augroup END
augroup js
	autocmd BufNewFile,BufRead *.js,*.javascript set expandtab
augroup END

augroup py
  autocmd BufNewFile,BufRead *.py set expandtab sw=4 ts=4 sts=4
augroup END

" Markdown should use spaces instead of tabs and a textwidth of 80 characters
augroup mkd
	autocmd BufNewFile,BufRead *.mkd,*.md,*.mkdn,*.markdown		set expandtab
augroup END

" TeX should use spaces instead of tabs and a textwidth of 80 characters
augroup tex
	autocmd BufNewFile,BufRead *.tex 	set expandtab
augroup END


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

" Mapping NERD_Tree toggle command to F3
map <F3> :NERDTreeToggle<CR>

" Mapping xclip clipboard support
" F6 for yank
" vmap <F6> :!xclip -f -sel clip<CR>
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
" F7 for put
"map <F7> mz:-1r !xclip -o -sel clip<CR>`z
nmap <F7> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" Making vim work as should while using tmux with $TERM="screen"
if &term == "screen"
	set term=xterm
endif

" Set solarized colorscheme
syntax enable
"let g:solarized_termtrans = 1
set t_Co=256
"colorscheme solarized

" CtrlP configs
" ctrlp will open the new file in the same window, overriding the default
" behavior of opening a vertical split
let g:ctrlp_open_new_file = 'r'

" What should CtrlP ignore?
" files that should not be editable like .so, swp, .zip, .exe and .dll
" /node_modules/ dirs should be avoided, cause they're not supposed to be
" edited via vim, but via npm.
set wildignore+=*.so,*.swp,*.zip,*/node_modules/*,*.exe,*.dll

" Enabling Powerline for VIM
python from powerline.bindings.vim import source_plugin; source_plugin()
set laststatus=2
let g:Powerline_symbols = 'fancy'

" Tagbar
nmap <F8> :TagbarToggle<CR>
