" go to normal mode from insert mode
inoremap jk    <esc>
inoremap kj    <esc>
" go to normal mode from terminal mode
tnoremap jk    <c-\><c-n>
tnoremap kj    <c-\><c-n>
" escape key does not do anything in favor of <j><k>
nnoremap <esc> <nop>
" quicker way to enter command mode
nnoremap ;     :

" toggle search highlight via back key
noremap <bs> :set hlsearch! hlsearch?<CR>

" disable arrow keys to get better at hjkl
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" reload vim config
nnoremap <leader>r :source $MYVIMRC<CR>

" Moving lines
" move line 1 down
nnoremap <A-j> :m .+1<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
" move line 1 up
nnoremap <A-k> :m .-2<CR>==
inoremap <A-k> <Esc>:m .-2<CR>==gi
" move visually selected lines up or down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Buffers
" show all buffer 
nnoremap <leader><Return> :buffers<CR>:buffer<Space>
" go to the next modifie  (unsaved) buffe 
nnoremap <leader>bc  :bm<CR>
" like :bm but in a new split
nnoremap <leader>sbc :sbm<CR>
" go to previous buffer
nnoremap <leader>bp  :bprev<CR>
" go to next buffer
nnoremap <leader>bn  :bnext<CR>
" go to first bufffer
nnoremap <leader>bf  :bf<CR>
" go to last buffer
nnoremap <leader>bl  :bl<CR>
" delete buffer (prompt for changes, if any)
nnoremap <leader>bd  :bd<space>
" delete buffer, discard changes (if any)
nnoremap <leader>bd! :bd!<space>

" Splits / windows
" create horizontal split
nnoremap <leader>sh  :split<CR>
" create vertical split
nnoremap <leader>sv  :vsplit<CR>
" cycle through windows
map      <Tab>       <C-w>w<CR>
" inverse of above
map      <S-Tab>     <C-w>p<CR>

" Tabs
" new empty tab
nnoremap <leader>t  :tabnew<CR>
" go to previous tab
nnoremap <leader>tp :tabp<CR>
" go to next tab
nnoremap <leader>tn :tabn<CR>
" close current tab
nnoremap <leader>tc :tabc<CR>
" close all other tabs
nnoremap <leader>tC :tabp<CR>

