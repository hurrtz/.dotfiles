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

" Plugins
nnoremap <leader>ff :call Preserve("normal gg=G")<cr>
nnoremap <leader>sw :call StripTrailingWhitespace()<cr>
nnoremap <leader>ft :Autoformat<cr>
nnoremap <silent><c-p> :Files<cr>
nnoremap <leader><enter> :Buffers<cr>
nnoremap <leader>/ :Ag<cr>
nnoremap <leader>b :TagbarToggle<cr>
nnoremap <leader>u :UndotreeToggle<cr>
nnoremap <leader>ga :Git add %:p<cr><cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit -v -q<cr>
nnoremap <leader>gt :Gcommit -v -q %:p<cr>
nnoremap <leader>gbl :Gblame<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>ge :Gedit<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr><cr>
nnoremap <leader>gl :silent! Glog<cr>:bot copen<cr>
nnoremap <leader>gp :Ggrep<space>
nnoremap <leader>gm :Gmove<space>
nnoremap <leader>gb :Git branch<space>
nnoremap <leader>go :Git checkout<space>
nnoremap <leader>gps :Git push<cr>
nnoremap <leader>gpl :Git pull<cr>
nnoremap <leader>gv :GV<cr>
nnoremap <leader>gvv :GV!<cr>
nnoremap <silent> <C-n><C-n> :NERDTreeToggle<cr>
nnoremap <silent> <C-n><C-f> :NERDTreeFind<cr>
nnoremap <silent> <C-n><C-m> :NERDTreeMirror<cr>

" Terminal mode
tnoremap jk <c-\><c-n>

" Neomake
nmap <leader><space>o :lopen<CR>      " open location window
nmap <leader><space>c :lclose<CR>     " close location window
nmap <leader><space>, :ll<CR>         " go to current error/warning
nmap <leader><space>n :lnext<CR>      " next error/warning
nmap <leader><space>p :lprev<CR>      " previous error/warning

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" FZF
nmap <tab>o :FZF<cr>
