set shell=/bin/sh

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

function! s:SourceConfigFilesIn(directory)
  let l:directory_splat = '~/.config/nvim/' . a:directory . '/*.vim'

  for l:config_file in split(glob(l:directory_splat), '\n')
    if filereadable(l:config_file)
      execute 'source' l:config_file
    endif
  endfor
endfunction

function! s:LoadPlugins()
  call plug#begin('~/.config/nvim/plugged')
  source ~/.config/nvim/plugins.vim
  call plug#end()
endfunction

let g:mapleader = ","

call s:LoadPlugins()
call s:SourceConfigFilesIn('rcbase')
call s:SourceConfigFilesIn('rcplugins')

runtime macros/matchit.vim

if has("termguicolors")
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif

colorscheme base16-default-dark
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
