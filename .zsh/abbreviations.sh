# ABBREVATIONS
typeset -a ealiases
ealiases=()
function abbrev-alias() {
    alias $1
    ealiases+=(${1%%\=*})
}
function expand-ealias() {
    if [[ $LBUFFER =~ "\<(${(j:|:)ealiases})\$" ]]; then
        zle _expand_alias
        zle expand-word
    fi
    zle magic-space
}
zle -N expand-ealias
bindkey ' '        expand-ealias
bindkey '^ '       magic-space
bindkey -M isearch " "      magic-space
expand-alias-and-accept-line() {
    expand-ealias
    zle .backward-delete-char
    zle .accept-line
}
zle -N accept-line expand-alias-and-accept-line

abbrev-alias g="git"
abbrev-alias ga="git add"
abbrev-alias gst="git status"
abbrev-alias glg="git lg"
abbrev-alias gd="git diff"
abbrev-alias gc="git commit"
abbrev-alias l="exa -l --sort=newest"
abbrev-alias ll="exa -la --sort=newest"
abbrev-alias sc="sudo systemctl"
abbrev-alias scu="systemctl --user"
abbrev-alias jl="sudo journalctl -n1000 -f -u"
abbrev-alias ju="journalctl --user -n1000 -f -u"
abbrev-alias dvorak="setxkbmap us -variant dvorak-alt-intl -option caps:escape"
abbrev-alias nv="nvim"
abbrev-alias vim="nvim"
abbrev-alias vi="nvim"
