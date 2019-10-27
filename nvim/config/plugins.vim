" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'

if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)

        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin(stdpath('data') . '/plugged')

" general "
Plug 'rakr/vim-one'
Plug 'romainl/vim-cool'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wakatime/vim-wakatime'
Plug 'sgur/vim-editorconfig'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" language "
Plug 'othree/html5.vim'
Plug 'groenewege/vim-less'
Plug 'hail2u/vim-css3-syntax'
Plug 'othree/csscomplete.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-gfm-syntax'
Plug 'joegesualdo/jsdoc.vim'
Plug 'pangloss/vim-javascript'
Plug 'othree/jspc.vim'
Plug 'posva/vim-vue'
Plug 'heavenshell/vim-jsdoc'
Plug 'jparise/vim-graphql'
Plug 'moll/vim-node'
Plug 'elzr/vim-json'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'raimon49/requirements.txt.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-jp/syntax-vim-ex'
Plug 'chrisbra/csv.vim'
Plug 'tpope/vim-git'
Plug 'ekalinin/Dockerfile.vim'
Plug 'tmux-plugins/vim-tmux'
Plug 'MTDL9/vim-log-highlighting'
Plug 'mboughaba/i3config.vim'
Plug 'robbles/logstash.vim'
Plug 'chr4/nginx.vim'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'amadeus/vim-xml'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'stephpy/vim-yaml'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" commands "
Plug 't9md/vim-choosewin'
Plug 'kana/vim-niceblock'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'
Plug 'liuchengxu/vista.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" interface "
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/committia.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'itchyny/calendar.vim'
Plug 'vimwiki/vimwiki'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" completion "
Plug 'Raimondi/delimitMate'
Plug 'wellle/tmux-complete.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-denite'
Plug 'prettier/vim-prettier', { 'do': 'npm i -g yarn && yarn install' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm i -g yarn && yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'ruby',
    \ 'html'
  \ ]
\ }

" denite "
Plug 'Shougo/denite.nvim'
Plug 'raghur/fruzzy', {'do': { -> fruzzy#install()}}
Plug 'Shougo/junkfile.vim'

" operators & text objects "
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'

" Initialize plugin system
call plug#end()
