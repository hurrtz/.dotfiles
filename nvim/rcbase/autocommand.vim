augroup fileType
  autocmd!
augroup END

autocmd fileType BufNewFile,BufReadPost *.md set filetype=markdown
autocmd fileType BufNewFile,BufReadPost *stylelintrc set filetype=json
autocmd fileType BufNewFile,BufReadPost inspircd.conf set filetype=xml
autocmd fileType BufNewFile,BufReadPost *ctags set filetype=config
autocmd fileType BufNewFile,BufReadPost *.jsx set filetype=javascript
autocmd fileType FileType javascript :iabbrev <buffer> iff if()<left>
autocmd fileType BufReadCmd set nohlsearch

autocmd Syntax vim,xml,html,xhtml,css,scss,js,jsx setlocal foldmethod=syntax

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

augroup highlightGroups
  autocmd!
augroup END

augroup fileSave
  autocmd!
augroup END
