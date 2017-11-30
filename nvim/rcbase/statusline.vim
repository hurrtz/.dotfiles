scriptencoding utf-8

set laststatus=2
set showtabline=2

let g:lightline = {
      \   'colorscheme': 'Dracula',
      \   'active': {
      \     'left': [ [ 'mode', 'paste'  ],
      \               [ 'fugitive', 'gitgutter' ],
      \               [ 'filename' ] ],
      \     'right': [ [ 'neomake', 'lineinfo' ],
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
      \     'gitgutter': 'LightLineSignify',
      \     'neomake': 'neomake#statusline#LoclistStatus',
      \   },
      \   'component_type': {
      \     'neomake': 'error',
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

function! LightLineSignify()
  let l:symbols = ['+', '-', '!']
  let [l:added, l:modified, l:removed] = sy#repo#get_stats()
  let l:stats = [l:added, l:removed, l:modified]  " reorder
  let l:hunkline = ''

  for l:i in range(3)
    if l:stats[l:i] > 0
      let l:hunkline .= printf('%s%s ', l:symbols[l:i], l:stats[l:i])
    endif
  endfor

  if !empty(l:hunkline)
    let l:hunkline = printf('%s', l:hunkline[:-2])
  endif

  return l:hunkline
endfunction
