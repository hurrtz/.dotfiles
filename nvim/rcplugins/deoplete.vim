let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

inoremap <expr><c-h> deoplete#smart_close_popup()."\<c-h>"
inoremap <expr><bs> deoplete#smart_close_popup()."\<c-h>"
inoremap <silent><cr> <c-r>=<SID>my_cr_function()<cr>
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

function! <SID>my_cr_function()
  return pumvisible() ? "\<c-y>" : "\<cr>"
endfunction

let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'tsx',
                \ 'javascript.tsx',
                \ ]
