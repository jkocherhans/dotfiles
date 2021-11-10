# From http://github.com/adamv/dotfiles/raw/master/completion_scripts/fab_completion.bash
# Requires Fabric >= 0.92

_fab_completion() {
    COMPREPLY=()

    # Fab in the path?
    /usr/bin/which -s fab || return 0

    # Fabfile in this folder?
    [[ -e fabfile.py ]] || return 0

    local cur="${COMP_WORDS[COMP_CWORD]}"

    tasks=$(fab --complete)
    COMPREPLY=( $(compgen -W "${tasks}" -- ${cur}) )
}

complete -F _fab_completion fab

