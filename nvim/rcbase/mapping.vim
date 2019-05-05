nnoremap Q <nop>
nnoremap <leader>so :so $MYVIMRC<cr>
vnoremap <leader>st :sort<cr>
nnoremap <leader>lc :lclose<cr>
nnoremap <leader>sv :tabe $MYVIMRC<cr>
nnoremap <leader>tc :tabclose<cr>
nnoremap <leader>tn :tabe<cr>
nnoremap <leader>to :tabo<cr>
nnoremap <leader>tl :tabnext<cr>
nnoremap <leader>th :tabprev<cr>
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap - ddp
nnoremap <leader>- yyp
nnoremap _ ddkP
nnoremap <leader>_ yyP
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *<c-o>
nnoremap <bs> :set hlsearch! hlsearch?<cr>
nnoremap <leader>bp :bprev<cr>
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>br :edit<cr>
nnoremap <leader>bf :brew<cr>
nnoremap <leader>bd :bd<space>
nnoremap <leader>v <c-w>v<c-w>l
nnoremap <leader>vsa :vert sba<cr>
vnoremap < <gv
vnoremap > >gv
nnoremap / /\v
nnoremap :s/ :s/\v
nnoremap ? ?\v
vnoremap / /\v
vnoremap ? ?\v
nnoremap <space> za " to map 'toggle this section' to the more accessible space
nnoremap ; :
map <leader>s :split <C-R>=expand("%:p:h") . "/" <CR>

" Terminal mode
tnoremap jk <c-\><c-n>

" Neomake
nmap <leader><space>o :lopen<CR>      " open location window
nmap <leader><space>c :lclose<CR>     " close location window
nmap <leader><space>, :ll<CR>         " go to current error/warning
nmap <leader><space>n :lnext<CR>      " next error/warning
nmap <leader><space>p :lprev<CR>      " previous error/warning