parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\n\[\e[32m\]\t\[\e[m\] \[\e[35m\]\u\[\e[m\]@\[\e[36m\]\h\[\e[m\] \[\e[33m\]\w\[\e[m\]\[\e[31m\]\`parse_git_branch\`\[\e[m\] \[\e[34m\][\$?]\[\e[m\]\[\e[37m\]\$\[\e[m\] "

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
