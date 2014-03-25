export PS1="\[\e[00;32m\]\t\[\e[0m\]\[\e[00;35m\] \u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[00;33m\] \w\[\e[0m\]\[\e[00;34m\] [\$?]\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"
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
