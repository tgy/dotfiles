function uvga -d 'Enable LVDS1 and disable VGA1'
    xrandr --output VGA1 --off
    xrandr --output LVDS1 --auto
end
