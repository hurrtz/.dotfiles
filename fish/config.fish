# needed because default would be some ugly cyan background with white color
set -g fish_pager_color_progress 'cyan'

# alias for git
alias gi=git

# autoload nvm and current node version
set -x NVM_DIR ~/.nvm
source ~/.config/fish/nvm-wrapper/nvm.fish

# nvm use node
set -g fish_user_paths "/usr/local/bin" $fish_user_paths

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function ..
    cd ..
end

function cd..
    cd ..
end

function db
	set user $HOME
    cd "$HOME/Dropbox"
end

function docs    
	switch (uname -s)
	    case Darwin Linux FreeBSD NetBSD DragonFly
			set documents $HOME/Documents
		case '*'
			set cygwin (eval uname -o)  
	    		if test $cygwin = "Cygwin"
	    			set documents (eval cygpath -O)
	    		end    
	    		return
	    	end    
	    	cd $documents
    end

function os
    switch (uname -s)
    case Darwin Linux FreeBSD NetBSD DragonFly
        eval command uname -s
    case "*"
    	switch (uname -s)
    	case Cygwin
    		eval command uname -s
    	case "*"
    		eval echo "undefined"
    	end
    end
end

function tag
	if test $argv[1] = "-d"
		# delete tag if provided
		if test $argv[2]
			eval command git tag -d $argv[2]
			command git push origin :refs/tags/$argv[2]
		end
	else
		# create new tag and push
    	eval command git tag -a $argv[1] -m $argv[1]
    	command git push --tags
    end
end
