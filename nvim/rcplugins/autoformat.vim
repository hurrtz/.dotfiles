let g:neoformat_enabled_javascript = ['prettiereslint']
let g:neoformat_enabled_scss = ['stylefmt']

function! neoformat#formatters#scss#stylefmt() abort
    return {
        \ 'exe': 'stylefmt',
        \ 'stdin': 1
        \ }
endfunction
