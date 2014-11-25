function! ydcv#ydcv(word)
	let result = system("ydcv '" . a:word . "'")
	for line in split(result, '\n')
		echo line
	endfor
endfunction

function! ydcv#ydcv_cursor()
	return ydcv#ydcv(expand("<cword>"))
endfunction

function! ydcv#ydcv_range()
	let words = s:get_visual_selection()
	return ydcv#ydcv(words)
endfunction

function! s:get_visual_selection()
  " Why is this not a built-in Vim script function?!
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

com! YDCVCursor call ydcv#ydcv_cursor()
com! -range YDCVRange call ydcv#ydcv_range()



