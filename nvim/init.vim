set shell=/bin/sh

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

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
call s:SourceConfigFilesIn('functions')
call s:SourceConfigFilesIn('rcplugins')

runtime macros/matchit.vim

if has("termguicolors")
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
    set termguicolors
endif

colorscheme base16-default-dark
hi Normal ctermbg=NONE guibg=NONE
