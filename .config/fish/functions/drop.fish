function drop -d 'Drop file to renard'
    switch (count $argv)
        case "1"
            scp $argv[1] renard:/home/drop/$argv[1]
        case "2"
            scp $argv[1] renard:/home/drop/$argv[2]
    end
end
