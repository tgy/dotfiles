function vga -d 'Enable VGA1 and disable LVDS1'
    xrandr --output LVDS1 --off
    xrandr --output VGA1 --auto
end
