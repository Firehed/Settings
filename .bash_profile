export PS1="\[\e[00;32m\]\t\[\e[0m\]\[\e[00;35m\] \u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[00;33m\] \w\[\e[0m\]\[\e[00;34m\] [\$?]\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"

export EDITOR=vim

export PATH=$PATH:~/bin:~/.composer/vendor/bin


alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."

alias vi="vim"

alias gap="git add -p"
alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias gpr="git pull --rebase"

# OS X uses different syntax for some commands :/
if [ "Darwin" == `uname` ]; then
	alias ls="ls -G"
else
	alias ls="ls --color"
fi
