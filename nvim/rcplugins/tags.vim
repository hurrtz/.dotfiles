let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_ctags_binary = "/usr/local/bin/ctags"
let g:vim_tags_directories = [".", ".git", "CVS"]
let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"
