" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" let g:NERDTreeHijackNetrw = 0

" enable line numbers
let NERDTreeShowLineNumbers = 1

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

hi! NERDTreeCWD guifg=#99c794

"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <silent> <C-n><C-n> :NERDTreeToggle<cr>
nnoremap <silent> <C-n><C-f> :NERDTreeFind<cr>
noremap <silent> <C-n><C-m> :NERDTreeMirror<cr>
