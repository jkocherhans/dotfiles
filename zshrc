eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

# Case insensitive completion
setopt nocaseglob
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# If any text is between the beginning of the line and the cursor,
# it will be used as a prefix filter for command history when you
# hit the up or down arrow key.
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward
