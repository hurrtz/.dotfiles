" Configuration and plugin-manager manager :)
" ---
" Maintainer: Rafael Bodill
" See: github.com/rafi/vim-config
"
" Plugin-manager agnostic initialization and user configuration parsing

" Set custom augroup
augroup user_events
	autocmd!
augroup END

" Disable vim distribution plugins
let g:loaded_getscript = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logiPat = 1
let g:loaded_matchit = 1
let g:loaded_matchparen = 1
let g:netrw_nogx = 1 " disable netrw's gx mapping.
let g:loaded_rrhelper = 1  " ?
let g:loaded_shada_plugin = 1  " ?
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_tutor_mode_plugin = 1
let g:loaded_2html_plugin = 1
let g:loaded_vimball = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1

" Set main configuration directory as parent directory
let $VIM_PATH =
	\ get(g:, 'etc_vim_path',
	\   exists('*stdpath') ? stdpath('config') :
	\   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC), ':h') :
	\   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
	\   ! empty($VIM_PATH) ? expand($VIM_PATH) :
	\   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
	\ )

" Set data/cache directory as $XDG_CACHE_HOME/vim
let $DATA_PATH =
	\ expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

function! s:main()
	if has('vim_starting')
		" When using VIMINIT trick for exotic MYVIMRC locations, add path now.
		if &runtimepath !~# $VIM_PATH
			set runtimepath^=$VIM_PATH
		endif

		" Ensure data directories
		for s:path in [
				\ $DATA_PATH,
				\ $DATA_PATH . '/undo',
				\ $DATA_PATH . '/backup',
				\ $DATA_PATH . '/session',
				\ $VIM_PATH . '/spell' ]
			if ! isdirectory(s:path)
				call mkdir(s:path, 'p')
			endif
		endfor

		" Search and use environments specifically made for Neovim.
		if has('nvim') && isdirectory($DATA_PATH . '/venv/neovim2')
			let g:python_host_prog = $DATA_PATH . '/venv/neovim2/bin/python'
		endif

		if has('nvim') && isdirectory($DATA_PATH . '/venv/neovim3')
			let g:python3_host_prog = $DATA_PATH . '/venv/neovim3/bin/python'
		endif

		if ! has('nvim') && has('pythonx')
			if has('python3')
				set pyxversion=3
			elseif has('python')
				set pyxversion=2
			endif
		endif
	endif
endfunction

call s:main()

" vim: set ts=2 sw=2 tw=80 noet :
