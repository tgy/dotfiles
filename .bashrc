#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# LANG


# PATH EXPORTS
PATH=$PATH:"/home/toogy/apps/todo"

export beep="beep -f 5000 -l 30 -r 2"

# KibiOCR shortcuts
alias kibi="cd /home/toogy/p/kibi"

# ALIASES
alias systemctl="sudo systemctl"
alias bashrc="vim ~/.bashrc && bash"
alias vimrc="vim ~/.vimrc"
alias i3config="vim ~/.i3/config"
alias xresources="vim ~/.Xresources && xrdb ~/.Xresources"
alias dvorak="setxkbmap us -variant dvorak-alt-intl"
alias fr="setxkbmap fr"
alias c="cd"
alias cp="cp -R"
alias g="git"
alias vi="vim"
alias svi="sudo vim"
alias s="sudo"
alias pacman="sudo pacman"
alias ls="ls -l"
alias l="ls -la --color=tty"
alias clip="xclip -sel clip"
alias i="pacman -S"
alias tmux="tmux -2"

alias uzip="unzip"

	# NETWORK
	alias jog="perl ~/jogsoul.pl ~/jogsoul.conf"
	alias wifepita="sudo netctl start epita && jog"

  # SSH
  alias tgyh="ssh toogy@37.59.62.110"
  alias tgy="tgyh -p 622"
  alias irc="ssh pair@too.gy -p 623"

  # Compilation

  alias m="make"
  alias mc="m clean"
  alias mr="m run"

  # PROJECT CD

  cdp () {
      cd ~/p/$1
  }

# COMPRESSION

# UNTAR
utar () {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2) tar xvjf $1 ;;
            *.tar.gz) tar xvzf $1 ;;
            *.tgz) tar xvzf $1 ;;
            *) echo "'$1' is not a tar archive" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

vga () {
    xrandr --output VGA1 --auto;
    xrandr --output LVDS1 --below VGA1;
}

uvga () {
    xrandr --output VGA1 --off
    xrandr --output LVDS1 --auto
}

# TAR BZ2
alias utarbz2="tar -jcvf"

# TAR GZ
alias utargz="tar -zcvf"

export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
alias t='todo.sh'

# COMPLETIONS
source ~/.bash/completion/todo

# Prompt
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'
PS1="${BLUE}(${RED}\w${BLUE}) ${NORMAL}\h ${RED}\$${NORMAL} "

# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color
