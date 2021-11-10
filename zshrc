export DOTFILES=$HOME/Projects/dotfiles

eval "$(/opt/homebrew/bin/brew shellenv)"

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit

    autoload -Uz bashcompinit
    bashcompinit
fi

source $DOTFILES/completion/fabric.bash

# Case insensitive completion
setopt nocaseglob
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

# If any text is between the beginning of the line and the cursor,
# it will be used as a prefix filter for command history when you
# hit the up or down arrow key.
bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward

# Python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

eval "$(direnv hook zsh)"
