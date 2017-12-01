# needed because default would be some ugly cyan background with white color
set -g fish_pager_color_progress 'cyan'

# alias for git
alias gi=git

# autoload nvm and current node version
set -x NVM_DIR ~/.nvm
source ~/.config/fish/nvm-wrapper/nvm.fish

# nvm use node
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
