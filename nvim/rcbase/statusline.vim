scriptencoding utf-8

set laststatus=2
set showtabline=2

let g:lightline = {
      \   'colorscheme': 'solarized',
      \   'active': {
      \     'left': [ [ 'mode', 'paste'  ],
      \               [ 'fugitive', 'gitgutter' ],
      \               [ 'filename' ] ],
      \     'right': [ [ 'ale', 'lineinfo' ],
      \                [ 'percent' ],
      \                [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \   },
      \   'component_function': {
      \     'readonly': 'LightLineFugitive',
      \     'modified': 'LightLineModified',
      \     'fugitive': 'LightLineFugitive',
      \     'filename': 'LightLineFilename',
      \     'fileformat': 'LightLineFileformat',
      \     'filetype': 'LightLineFiletype',
      \     'fileencoding': 'LightLineFileencoding',
      \     'mode': 'LightLineMode',
      \     'gitgutter': 'LightLineGitGutter',
      \     'ale': 'LightLineALE',
      \   },
      \   'separator': { 'left': '', 'right': ''},
      \   'subseparator': { 'left': '|', 'right': '|'}
      \ }

function! LightLineModified()
  return &filetype =~# 'help\|undotree' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &filetype !~? 'help\|undotree' && &readonly ? '' : ''
endfunction

function! LightLineFugitive()
  if &filetype !~? 'undotree' && exists('*fugitive#head')
    let l:branch = fugitive#head()
    return l:branch !=# '' ? ' '.l:branch : ''
  endif
  return ''
endfunction

function! LightLineFilename()
  return ('' !=# LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' !=# expand('%') ? expand('%') : '[No Name]') .
        \ ('' !=# LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineALE() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
endfunction

function! LightLineMode()
  let l:fname = expand('%:t')
  return l:fname =~# '__Tagbar__' ? 'Tagbar' :
        \ l:fname =~# 'undotree' ? 'Undotree' :
        \ l:fname =~# 'diffpanel' ? 'Diffpanel' :
        \ winwidth(0) > 60 ? g:lightline#mode() : ''
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'
function! TagbarStatusFunc(fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

function! LightLineGitGutter()
  if ! exists('*GitGutterGetHunkSummary()')
    \ || ! get(g:, 'gitgutter_enabled', 0)
    \ || winwidth('.') <= 90
    return ''
  endif
  let l:symbols = [
    \ g:gitgutter_sign_added . ' ',
    \ g:gitgutter_sign_modified . ' ',
    \ g:gitgutter_sign_removed . ' '
  \ ]
  let l:hunks = GitGutterGetHunkSummary()
  let l:ret = []
  for l:i in [0, 1, 2]
    if l:hunks[l:i] > 0
      call add(l:ret, l:symbols[l:i] . l:hunks[l:i])
    endif
  endfor
  return join(l:ret, ' ')
endfunction
