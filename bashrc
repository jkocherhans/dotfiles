export DOTFILES=$HOME/Projects/dotfiles
export EDITOR=vim

# Put /usr/local first on $PATH.
export PATH=/usr/local/bin:/usr/local/sbin:$PATH


# history ####################################################################

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend


# git ########################################################################

source /usr/local/etc/git-completion.bash


# ssh ########################################################################

# Thanks to Tom Tobin for the ssh key laziness

function pubkey_push () {
    if [ $1 ] ; then
        cat ~/.ssh/id_dsa.pub | ssh $1 'mkdir ~/.ssh; cat - >> ~/.ssh/authorized_keys'
    else
        echo "Usage: pubkey_push [hostname]"
    fi
}


# python #####################################################################

# Recursively delete *.pyc in the given directory
function pyclean () {
    if [ $1 ] ; then
        find $1 -name '*.pyc' | xargs rm
    else
        echo "Usage: pyclean [dirname]"
    fi
}


# screen #####################################################################

# Allows the scrollbar in terminal.app to work with screen
alias screen='TERM=screen && screen -d -RR'


# prompt #####################################################################

# From http://github.com/bitprophet/dotfiles/blob/master/.bashrc

# Multiplatform sed tomfoolery used below (extended regexp)
case $(uname -s) in
    # -E flag, and override macports sed=>gsed alias
    Darwin ) alias esed='/usr/bin/sed -E' ;;
    # -r flag with GNU sed on Linux
    Linux ) alias esed='sed -r' ;;
esac

# Prompt function because PROMPT_COMMAND is awesome
function set_prompt() {
    # User/hostname
    userhost="${UC}\u@${HD}${NIL}"

    # Special vim-tab-like shortpath
    _pwd=`pwd | sed "s#$HOME#~#"`
    if [[ $_pwd == "~" ]]; then
        _dirname=$_pwd
    else
        _dirname=`dirname $_pwd | esed "s/\/(.)[^\/]*/\/\1/g"`
        if [[ $_dirname == "/" ]]; then
            _dirname=""
        fi
        _dirname="$_dirname/`basename $_pwd`"
    fi
    path="${LC}${_dirname}${NIL}"

    # Virtualenv
    _venv=`basename "$VIRTUAL_ENV"`
    venv="" # need this to clear it when we leave a venv
    if [[ -n $_venv ]]; then
        venv=" ${NIL}{${PURPLE}${_venv}${NIL}}"
    fi

    # Git branch
    _branch=$(git symbolic-ref HEAD 2>/dev/null)
    _branch=${_branch#refs/heads/} # apparently faster than sed
    branch="" # need this to clear it when we leave a repo
    if [[ -n $_branch ]]; then
        branch=" ${NIL}[${PURPLE}${_branch}${NIL}]"
    fi

    # Dollar/pound sign
    end="${LC}\$${NIL} "

    # Title for Terminal.app
    # http://superuser.com/questions/52483/terminal-tips-and-tricks-for-mac-os-x/127447#127447
    title="\[\033]0;${_venv}\007\]"

    # Feels kind of like cheating...but works so well!
    export PS1="${title}${userhost}:${path}${venv}${branch} ${end}"
}
export PROMPT_COMMAND=set_prompt

# local ######################################################################

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi

if [ -f ~/Projects/django/trunk/extras/django_bash_completion ]; then
  . ~/Projects/django/trunk/extras/django_bash_completion
fi

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

if [ -f `brew --prefix`/Library/Contributions/brew_bash_completion.sh ]; then
  . `brew --prefix`/Library/Contributions/brew_bash_completion.sh
fi


# virtualenv/pip #############################################################

export PIP_RESPECT_VIRTUALENV=true
export PROJECT_HOME=$HOME/Projects

if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
  . /usr/local/bin/virtualenvwrapper.sh
fi

_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

# fabric #####################################################################

source $DOTFILES/completion/fabric.bash


# pman #######################################################################

pman () {
    man -t "${1}" | open -f -a /Applications/Preview.app
}

# node.js ####################################################################

export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node

