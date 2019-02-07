### Learning Swift 4.2

Practice code snippets

:)


```bash
export HOME=~
alias ssl="openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem"

# config files
alias bash="vim ~/.bashrc"
alias vbash="code ~/.bashrc"
alias gconfig="code ~/.gitconfig"
alias ssh=" ssh-keygen -o -t rsa -b 4096 -C"

# clear terminal
alias _="clear"
# change directories
alias ~="cd ~"
alias home="~ && cd OneDrive/senor && cd" 
alias del="rm -rf "
alias step="cd .."
alias anos="step && cd "
alias dos="step && step && cd "
alias tres="step && step && step && cd "

# git commands
alias init="git init"
alias clone="git clone"
alias status="git status"
alias add="git add "
alias all="add ."
alias diff="git diff "
alias commit="git commit -m"
alias amend="git commit --amend"
alias pull="git pull"
alias push="git push"
alias fetch="git fetch"
alias change="git remote set-url origin"
alias register="git remote add origin"
alias pushx="push --set-upstream origin"
alias update="all && git commit -m 'update'"
alias bounce="git checkout"
alias merge="git merge"
alias nuke="all && update && push"
alias deploy="push -u origin master"
alias submodule="git submodule update --recursive --remote"
alias cloner="clone --recurse-submodules -j8"
alias parent="git remote -v"

# jekyll commands
alias jay="bundle exec jekyll serve"

# Hugo Commands
alias hs="hugo server"
alias hn="hugo new"
alias hp="rm -rf public && hugo"

# Hexo commands

alias hex="hexo clean && hexo deploy"

if test -f /etc/profile.d/git-sdk.sh
then
	TITLEPREFIX=SDK-${MSYSTEM#MINGW}
else
	TITLEPREFIX=$MSYSTEM
fi

PS1='\[\033]0;${PWD//[^[:ascii:]]/?}\007\]' # set window title
PS1="$PS1"'\[\033[1;32m\]'       # change to purple
PS1="$PS1"'\W'                 # current working directory
if test -z "$WINELOADERNOEXEC"
then
	GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
	COMPLETION_PATH="${GIT_EXEC_PATH%/libexec/git-core}"
	COMPLETION_PATH="${COMPLETION_PATH%/lib/git-core}"
	COMPLETION_PATH="$COMPLETION_PATH/share/git/completion"
	GIT_PS1_SHOWDIRTYSTATE=true
	GIT_PS1_SHOWSTASHSTATE=true
	GIT_PS1_SHOWUNTRACKEDFILES=true
	GIT_PS1_SHOWCOLORHINTS=true
	if test -f "$COMPLETION_PATH/git-prompt.sh"
	then
		. "$COMPLETION_PATH/git-completion.bash"
		. "$COMPLETION_PATH/git-prompt.sh"
		PS1="$PS1"'\[\033[1;31m\]'  # change color to cyan
		PS1="$PS1"'`__git_ps1`'   # bash function
	fi
fi
PS1="$PS1"'\[\033[0m\]'        # change color
PS1="$PS1"': '                 
MSYS2_PS1="$PS1" 
```