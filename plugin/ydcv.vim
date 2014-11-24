function! ydcv#ydcv()
	let word = expand("<cword>")
	let result = system("ydcv '" . word . "'")
	for line in split(result, '\n')
		echo line
	endfor
endfunction

com! YDCV call ydcv#ydcv()



