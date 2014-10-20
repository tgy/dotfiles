# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dpoggi"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=/home/toogy/bin:/usr/local/bin:$PATH
export PATH=/home/toogy/.gem/ruby/2.1.0/bin:$PATH
export PATH=/home/toogy/asm/scripts:$PATH

export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

#bindkey -v

export EDITOR="/usr/bin/vim"

setopt completealiases
zstyle ':completion:*' menu select

autoload -U promptinit
promptinit

export beep="beep -f 5000 -l 30 -r 2"

# >>>>> ALIASES

# DOTFILES
alias i3config="vim ~/.i3/config"
alias xresources="vim ~/.Xresources && xrdb ~/.Xresources"
alias zshrc="vim ~/.zshrc"

# Keyboards
alias dvorak="setxkbmap us -variant dvorak-alt-intl -option caps:escape"
alias fr="setxkbmap fr"
alias us="setxkbmap us"

alias cp="/usr/bin/gcp -rf"
alias rename="perl-rename"
alias g="git"
alias vi="vim"
alias v="vim"
alias svi="sudoedit"
alias ls="ls -lah --color=auto"
alias lst="ls -tr"
alias l="ls"
alias clip="xclip -sel clip"
alias i="pacman -S"
alias tmux="tmux -2"
alias df="df -h"
alias du="du -h"
alias vimrc="vim ~/.vimrc"

# CDs
alias cdp="cd ~/p"

# DJANGO
alias pd="python manage.py"
alias rs="./runserver"

# Python venv
export WORKON_HOME='~/.virtualenvs'
source /usr/bin/virtualenvwrapper.sh

alias uzip="unzip"

# NETWORK
alias jog="perl ~/jogsoul.pl ~/jogsoul.conf"

# Compilation

alias m="make"
alias mc="make clean"
alias mr="m && make run"

# DEBUG
alias leak="valgrind --leak-check=full"

function c ()
{
    if [ "$1" = "" ]; then
        cd;
    else
        cd "$1";
    fi
    pwd > ~/.currentpwd
}

if [ ! -f ~/.currentpwd ]; then
  touch ~/.currentpwd
fi

cd $(cat ~/.currentpwd)

# FUNCTIONS ->
clipin () {
    clip -o >> $1
}

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

# MKCD

mkcd () {
    mkdir -p $1 && cd $1
}

vga () {
    xrandr --output VGA1 --auto;
    xrandr --output LVDS1 --below VGA1;
}

uvga () {
    xrandr --output VGA1 --off
    xrandr --output LVDS1 --auto
}

# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color

# SSH
function ssht() {
  ssh $* -t 'export TERM=screen-256color; tmux -u a || tmux -u || /bin/bash'
}

alias ln="ln -v"
alias ccat="pygmentize -g"

# Java specific

# Better font rendering
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on'
export IDEA_JDK='/opt/java7/'

# Viciplace & Symfony 2
alias vpvm='vboxmanage startvm vmubuntu --type headless'

function mounttorrents() {
  sshfs tgy:/home/torrents /mnt/torrents;
  cd /mnt/torrents;
}


function count-files() {
  ls -l $1 | wc -l
}

setopt menu_complete

# SLRN
export NNTPSERVER=news.epita.fr

function Ч ()
{
  dvorak
}

# stderred
if [ -f "/usr/lib/libstderred.so" ]; then
  export LD_PRELOAD="/usr/lib/libstderred.so"
fi

export PAGER=most
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
