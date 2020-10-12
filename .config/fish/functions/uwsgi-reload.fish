function uwsgi-reload -d 'Reload uwsgi vassal'
    sudo touch -h /etc/uwsgi/vassals/$argv[1].ini
end
