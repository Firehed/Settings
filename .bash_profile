export PS1="\[\033[0;35m\]\\u\[\033[0m\]@\[\033[0;36m\]\h\[\033[0;33m\] \\w\[\033[0m\]: "
export MAKE_USER=eric
export EDITOR=vim


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias vi="vim"

alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gpush="git push origin master"
alias gpull="git pull origin master"

# OS X uses different syntax for some commands :/
if [ "Darwin" == `uname` ]; then
	alias ls="ls -G"
else
	alias ls="ls --color"
fi
