shopt -s cdspell
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTIGNORE="&:ls:[bf]g:exit"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# multi-line commands are stored in the history as a single command
shopt -s cmdhist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export TERM=xterm-256color
alias cp="cp -i"
alias rm='rm -i'
alias e='emacsclient -t'
alias ec='emacsclient -c -n'
export SUDO_EDITOR="emacsclient -t"
export ALTERNATE_EDITOR=""
export EDITOR="emacs"

tmux() {
  if test $# -eq 0; then
    $(which tmux) attach
  else
    $(which tmux) $@
  fi
}

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
