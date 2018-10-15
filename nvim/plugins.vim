" Interface
Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'zhaocai/GoldenView.Vim'
Plug 'itchyny/lightline.vim'

" Editing and Formatting
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'mbbill/undotree'
Plug 'sbdchd/neoformat'
Plug 'mattn/emmet-vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'ternjs/tern_for_vim', { 'do': 'npm install -g tern' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux'

" Navigation
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tmhedberg/matchit'

" Source Control
Plug 'airblade/vim-gitgutter'
Plug 'gregsexton/gitv'
Plug 'tpope/vim-fugitive'

" Miscellaneous
Plug 'craigemery/vim-autotag'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-dispatch'
Plug 'ryanoasis/vim-devicons'
Plug 'skywind3000/asyncrun.vim'
Plug 'wakatime/vim-wakatime'
