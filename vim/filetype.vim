" markdown filetype file
if exists("did\_load\_filetypes")
    finish
endif

" Adding suport for markdown
augroup markdown
    au! BufRead,BufNewFile *.mkd,*.md,*.markdown   setf mkd
augroup END

" Adding suport for nginx
augroup nginx
	au BufRead,BufNewFile /etc/nginx/* setf nginx
augroup END
