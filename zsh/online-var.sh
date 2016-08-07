# vim: fdm=marker fdl=0
# vim: ft=zsh

# variables# {{{
export EDITOR="nvim"
export VISUAL='nvim'
export TERM="xterm-256color"
export PAGER="less"
export DOTFILE_ROOT=${HOME}/.dotfile
export ZSH_ROOT=${DOTFILE_ROOT}/zsh
export DOTFILE_BUNDLE_ROOT=${DOTFILE_ROOT}/gundle/
export INSTALL_ROOT=${HOME}/softs/install/
# }}}
function source_if_exist() { # {{{
  if [[ -f ${1} ]]; then
    source "$@" &> /dev/null
  fi
} # }}}

# OS independent alias# {{{
# keep it in lexicographic order
unalias rm &> /dev/null
alias gst='git status'
alias gd='git diff'
alias gpa='git remote | xargs -L1 git push'
alias sumcol='paste -sd+ - | bc'
alias ssh='ssh -Y'
# }}}

# OS independent PATH for softwares
# madagascar# {{{
source_if_exist ${INSTALL_ROOT}/madagascar/share/madagascar/etc/env.sh
export PYTHONPATH=$PYTHONPATH:$RSFSRC/build/book/Recipes
export DATAPATH=${HOME}/.rsfdata
# }}}
# ${HOME}/.dotfile/bin# {{{
export PATH=${HOME}/.dotfile/bin:$PATH
# }}}

# Settings for Linux and MAC
if [[ "$OSTYPE" == "linux-gnu" ]]; then # only set for Linux
# Linux alias# {{{
alias docker-stop-all='docker stop `docker ps -aq`'
alias docker-rm-all='docker rm `docker ps -aq`'
alias open='gnome-open'
# }}}
# CUDA# {{{
export PATH=${INSTALL_ROOT}/cuda:$PATH
# }}}
# boost# {{{
export LD_LIBRARY_PATH=${INSTALL_ROOT}/boost/lib:$LD_LIBRARY_PATH
# }}}
# matlab# {{{
export PATH=${INSTALL_ROOT}/matlab/bin:$PATH
# }}}
# maxcompiler# {{{
source_if_exist ${INSTALL_ROOT}/maxcompiler/settings.sh
export PATH=$MAXELEROSDIR/utils:$PATH
# }}}
# texlive# {{{
export PATH=${INSTALL_ROOT}/texlive/bin/x86_64-linux:$PATH
export MANPATH=${INSTALL_ROOT}/texlive/texmf/doc/man:$MANPATH
# }}}
# linuxbrew# {{{
export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
# }}}
elif [[ "$OSTYPE" == "darwin"* ]]; then # only set for MAC
# coreutils# {{{
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
# }}}
fi
