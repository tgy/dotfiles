set -gx EDITOR /usr/bin/nvim
set -gx TERM screen-256color
set -gx BROWSER qutebrowser

set -gx LANG en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8
set -gx LC_NUMERIC en_US.UTF-8
set -gx LC_TIME en_US.UTF-8
set -gx LC_COLLATE en_US.UTF-8
set -gx LC_MONETARY en_US.UTF-8
set -gx LC_MESSAGES en_US.UTF-8
set -gx LC_PAPER en_US.UTF-8
set -gx LC_NAME en_US.UTF-8
set -gx LC_ADDRESS en_US.UTF-8
set -gx LC_TELEPHONE en_US.UTF-8
set -gx LC_MEASUREMENT en_US.UTF-8
set -gx LC_IDENTIFICATION en_US.UTF-8

set -gx NVIM_TUI_ENABLE_CURSOR_SHAPE 1
set -gx _OLD_FISH_PROMPT_OVERRIDE
set -gx _OLD_VIRTUAL_PATH

# Entering SSH passphrase only once
eval (keychain --eval --agents ssh -Q --quiet id_rsa --nogui)

# Change starting directory
if [ ! -f ~/.currentpwd ]
    touch ~/.currentpwd
end

function c -d 'Change starting directory'
    if [ "$argv[1]" = "" ]
        cd
    else
        cd "$argv[1]"
    end
    pwd > ~/.currentpwd
end

cd (cat ~/.currentpwd)

# abbreviations
. ~/.config/fish/abbreviations.fish

# paths
set -gx PATH /home/toogy/opt/bin $PATH
set -gx PATH /home/toogy/go/bin $PATH
set -gx PATH /home/toogy/.gem/ruby/2.4.0/bin $PATH
set -gx PATH /usr/bin/vendor_perl $PATH
set -gx GOPATH /home/toogy/go
set -x PATH /home/toogy/opt/bin $PATH

function nl
    source ~/miniconda3/etc/fish/conf.d/conda.fish
    conda activate neurolang
end
