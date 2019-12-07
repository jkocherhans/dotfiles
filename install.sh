#!/bin/bash

export DOTFILES_HOME=$HOME/Projects/dotfiles

ln -sf "$DOTFILES_HOME/bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_HOME/bash_profile" "$HOME/.bash_profile"

ln -sf "$DOTFILES_HOME/zshrc" "$HOME/.zshrc"

ln -sf "$DOTFILES_HOME/inputrc" "$HOME/.inputrc"

ln -sf "$DOTFILES_HOME/gitconfig" "$HOME/.gitconfig"

ln -sf "$DOTFILES_HOME/screenrc" "$HOME/.screenrc"
ln -sf "$DOTFILES_HOME/tmux.conf" "$HOME/.tmux.conf"
