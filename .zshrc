# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dpoggi"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/toogy/apps/todo:/home/toogy/apps/pycharm/bin:/home/toogy/apps/phpstorm/bin:/home/toogy/apps/sublime_text_3"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#

#bindkey -v

export EDITOR="/usr/bin/vim"

setopt completealiases
zstyle ':completion:*' menu select

autoload -U promptinit
promptinit

export beep="beep -f 5000 -l 30 -r 2"

# PATH
export PATH=$PATH:"/home/toogy/apps/todo"
export PATH=$PATH:"/home/toogy/apps/sublime_text_3"

# >>>>> ALIASES

alias systemctl="sudo systemctl"

# PACMAN
alias pacman="sudo pacman"

# DOTFILES
alias xresources
alias i3config="vim ~/.i3/config"
alias xresources="vim ~/.Xresources && xrdb ~/.Xresources"
alias dvorak="setxkbmap us -variant dvorak-alt-intl"
alias fr="setxkbmap fr"
alias us="setxkbmap us"
alias cp="/usr/bin/gcp -rf"
alias rename="perl-rename"
alias g="git"
alias vi="vim"
alias v="vim"
alias svi="sudoedit"
alias pacman="sudo pacman"
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
alias src="source ../bin/activate"

alias uzip="unzip"

# NETWORK
alias jog="perl ~/jogsoul.pl ~/jogsoul.conf"
alias wifepita="sudo netctl start epita && jog"

# Compilation

alias m="make"
alias mc="make clean"
alias r="make run"
alias mr="m && r"

# DEBUG
alias leak="valgrind -v --leak-check=full"

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
    xclip -o >> $1
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

export TODOTXT_DEFAULT_ACTION=ls
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -k 2,2 -k 1,1n'
alias t='todo.sh'

# COMPLETIONS
source ~/.bash/completion/todo

# for tmux: export 256color
[ -n "$TMUX" ] && export TERM=screen-256color

# SSH
function ssht() {
  ssh $* -t 'export TERM=screen-256color; tmux -u a || tmux -u || /bin/bash'
}

TGY="37.59.62.110"

alias tgy="ssht toogy@$TGY"
alias irc="ssht irc@$TGY"
alias torrent="ssht torrent@$TGY"


alias ln="ln -v"
alias ccat="pygmentize -g"

# Java specific

# Better font rendering
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=lcd'
export IDEA_JDK='/opt/java7/'
