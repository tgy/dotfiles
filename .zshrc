bindkey -e

source ~/.profile

setopt appendhistory
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

eval "$(starship init zsh)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
source ~/.zsh/abbreviations.sh


source /usr/share/zsh/plugins/zsh-fzf-plugin/fzf.plugin.zsh
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export MAMBA_EXE="/home/v/.local/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/v/micromamba";
__mamba_setup="$('/home/v/.local/bin/micromamba' shell hook --shell zsh --prefix '/home/v/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/v/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/v/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/v/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup

micromamba activate val
