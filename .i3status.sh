#!/usr/bin/env sh

i3status | (read line && echo $line && read line && echo $line && while :
do
    read line
    song=$(mpc current)
    status=$(mpc | sed -n 2p | cut -d' ' -f1)
    dat="[{ \"full_text\": \"${status} ${song}\" },"
    echo "${line/[/$dat}" || exit 1
done)
