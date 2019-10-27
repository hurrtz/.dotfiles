" :Prettier/:PrettierAsync for formatting
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
command! -nargs=0 PrettierAsync :call CocAction('runCommand', 'prettier.formatFile')

augroup coc_setup
  autocmd!

  " Close preview window when completion is done
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

augroup automake
  autocmd!

  " COC handles auto-linting . Setup formatting via prettier
  autocmd BufWritePre *.js,*.json,*.ts Prettier
augroup END

" Trigger completion via same as omni-completion
inoremap <silent><expr> <C-x><C-o> coc#refresh()

nnoremap <silent> <leader>lk <Plug>(coc-action-doHover)

" Note: These do not work with `noremap`
nmap <leader>lc <Plug>(coc-references)
nmap <leader>ld <Plug>(coc-definition)
nmap <leader>li <Plug>(coc-implementation)
nmap <leader>lr <Plug>(coc-rename)
nmap <leader>ls <Plug>(coc-documentSymbols)
nmap <leader>lt <Plug>(coc-type-definition)

vmap <leader>lf <Plug>(coc-format-selected)
nmap <leader>lf <Plug>(coc-format-selected)

nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Navigation snippet sections with C-j/k
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
" }}}
