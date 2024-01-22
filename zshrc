export \
    PATH=$HOME/.local/bin:$HOME/go/bin:$PATH \
    EDITOR="nvim" \
    DISTRO=$(grep "^ID=" /etc/os-release | cut -d = -f 2) \
    DISTRO_FAMILY=$(grep "^ID_LIKE=" /etc/os-release | cut -d = -f 2) \
    XDG_DATA_HOME=$HOME/.local/share \
    XDG_CONFIG_HOME=$HOME/.config \
    XDG_STATE_HOME=$HOME/.local/state \
    XDG_CACHE_HOME=$HOME/.cache

# Config history
HISTFILE="$HOME/.local/share/zsh_history"
SAVEHIST=50000
HISTFILESIZE=50000
HISTSIZE=50000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data between sessions

# Don't save failed commands to history
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# Load aliases
. $HOME/.zsh/aliases.zsh

# Enable vim mode
bindkey -v

# Bind history search
bindkey '^R' history-incremental-search-backward

# Ubuntu's command not found package provides instructions to install the
# package that provides the command in case it was not found.
if [ "$DISTRO" = "ubuntu" ] && [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi

# zsh-autosuggestions
autosugg_path=/usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
if [ -f $autosugg_path ]; then
    . $autosugg_path
fi

# asdf
asdf_path=$HOME/.asdf/asdf.sh
if [ -d $asdf_path ]; then
    . asdf_path
fi

# starship prompt
command -v "starship" &> /dev/null
if [ $? -eq 0 ]; then
    eval "$(starship init zsh)"
fi

# zoxide
command -v "zoxide" &> /dev/null
if [ $? -eq 0 ]; then
    eval "$(zoxide init zsh)"
fi

