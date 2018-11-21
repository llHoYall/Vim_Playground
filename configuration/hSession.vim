set undofile

if !has('nvim')
	set undodir=~/.vim/undo
endif

augroup hSession
	autocmd!
	autocmd BufWrwitePre	/tmp/*	setlocal nounfile
augroup END
