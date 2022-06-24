REALPATH_TO_SELF=$(readlink "$BASH_SOURCE")
REALPATH_TO_SRC_DIR=$(dirname "$REALPATH_TO_SELF")

source $REALPATH_TO_SRC_DIR/git-prompt.sh

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
    PS1+="$RED`__git_ps1 '(%s) '`"
    PS1+="$BLUE[$EXIT] "
    PS1+="$WHITE\\\$ " # $ for user, # for root
    PS1+="$RESET"
}

export EDITOR=vim

export HOMEBREW_NO_AUTO_UPGRADE=1

export PATH=$PATH:~/bin:~/.composer/vendor/bin:~/.cargo/bin

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export RUST_SRC_PATH="$HOME/dev/rust/src"


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias fpp="fpp -ni"

alias vi="vim"

repoUsesMain() {
    git show-ref --verify --quiet refs/heads/main
}

alias diff="diff -u" # Use git-style formatting

alias gap="git add -p"
# alias gcm="git checkout master"
alias gca="git commit --amend"
alias gcm="git-switch 0"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gpr="git pull --rebase"
# "Changed files"
cf() {
    local branch=""
    if $(repoUsesMain); then
        branch="main"
    else
        branch="master"
    fi
    # echo ${repoUsesMain()}
    # echo $branch
    git diff --name-only $branch
}

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

alias g="cd ~/dev/github"

# Bash completion tools
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

if [ -d ~/.complete ]; then
    for f in ~/.complete/*; do
        source $f;
    done
fi
