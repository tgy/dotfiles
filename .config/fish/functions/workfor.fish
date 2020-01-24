function workfor -d 'Work for n minutes'
    set cmd "notify-send --icon=gtk-info Break \"It's break time\""
    echo "$cmd" | at "now + $argv[1] minutes"
end
