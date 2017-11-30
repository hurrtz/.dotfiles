" function! Preserve(command)
"  let l:_s=@/
"  let l:l = line('.')
"  let l:c = col('.')
"  execute a:command
"  let @/=l:_s
"  call cursor(l:l, l:c)
" endfunction

" function! StripTrailingWhitespace()
"  call Preserve('%s/\\s\\+$//e')
" endfunction
