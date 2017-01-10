export PS1="\[\e[00;32m\]\t\[\e[0m\]\[\e[00;35m\] \u\[\e[0m\]\[\e[00;37m\]@\[\e[0m\]\[\e[00;36m\]\h\[\e[0m\]\[\e[00;33m\] \w\[\e[0m\]\[\e[00;34m\] [\$?]\[\e[0m\]\[\e[00;37m\]\$ \[\e[0m\]"

export EDITOR=vim

export PATH=$PATH:~/bin:~/.composer/vendor/bin:~/.cargo/bin

export RUST_SRC_PATH="$HOME/dev/rust/src"


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

# Lots of programs like to store API tokens and such in the environment. Instead
# of adding them to this file and risk committing them to version control, throw
# them all in a separate file
[[ -s "$HOME/.keys" ]] && source "$HOME/.keys"

# Chances are that when I'm using `vagrant ssh`, I want to start in /vagrant
if [ "vagrant" == $USER ]; then
	cd /vagrant
fi
