xset +fp /usr/share/fonts/local
xset fp rehash
xrdb -load ~/.Xresources &
setxkbmap -layout us -variant dvorak-alt-intl
exec i3

