parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

# Colors
RESET='\[\e[0m\]'
BLACK='\[\e[0;30m\]'
RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
MAGENTA='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
WHITE='\[\e[0;37m\]'

PROMPT_COMMAND=__prompt_command
__prompt_command() {
    # Capture exit code before git branch to avoid overwrite
    local EXIT=$?
    PS1="\n"
    PS1+="$GREEN\t " # Timestamp
    PS1+="$MAGENTA\u$RESET@$CYAN\h " # user@host
    PS1+="$YELLOW\w " # CWD from ~
    PS1+="$RED`parse_git_branch`"
    PS1+="$BLUE[$EXIT] "
    PS1+="$WHITE\\\$ " # $ for user, # for root
    PS1+="$RESET"
}

export EDITOR=vim

export PATH=$PATH:~/bin:~/.composer/vendor/bin:~/.cargo/bin

export RUST_SRC_PATH="$HOME/dev/rust/src"


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias fpp="fpp -ni"

alias vi="vim"

alias gap="git add -p"
alias gcm="git checkout master"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gpr="git pull --rebase"
alias cf="git diff --name-only master"

alias rg="rg -S"

# OS X uses different syntax for some commands :/
if [ "Darwin" == `uname` ]; then
	alias ls="ls -G"
else
	alias ls="ls --color"
fi

# Lots of programs like to store API tokens and such in the environment. Instead
# of adding them to this file and risk committing them to version control, throw
# them all in a separate file
[[ -s "$HOME/.keys" ]] && source "$HOME/.keys"

# Chances are that when I'm using `vagrant ssh`, I want to start in /vagrant
if [ "vagrant" == $USER ]; then
	cd /vagrant
fi

# Bash completion tools
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -d ~/.complete ]; then
    for f in ~/.complete/*; do
        source $f;
    done
fi
