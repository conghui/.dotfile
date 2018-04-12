# vim: fdm=marker fdl=0 ft=zsh
# keep this file as simple & clean as possible

#########################################################################
## TWO IMPORTANT SWITCHES
## 1. set LINUXBREW_HOME to where the linuxbrew is installed
## 2. set _ANTIGEN_CACHE_ENABLED to true if you don't modify this file
#########################################################################
#
# independent variables
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export PAGER="less"
export DOTFILEDIR=${HOME}/.dotfile
export INSTALL_ROOT=${HOME}/softs/install
# source zsh/custom at first # {{{
if ls $DOTFILEDIR/zsh/custom/ | grep -q '.zsh'; then
  for f in $DOTFILEDIR/zsh/custom/*.zsh; do
    source $f
  done
fi
# }}}

# setup PATH for linuxbrew/homebrew # {{{
LINUXBREW_HOME=${LINUXBREW_HOME:-$HOME/.linuxbrew}
if [[ "$OSTYPE" == "linux-gnu" ]]; then # only set for Linux
  export PATH="$LINUXBREW_HOME/bin":"$LINUXBREW_HOME/sbin":$PATH
  export MANPATH="$LINUXBREW_HOME/share/man":$MANPATH
  export INFOPATH="$LINUXBREW_HOME/share/info":$INFOPATH
elif [[ "$OSTYPE" == "darwin"* ]]; then # only set for MAC
  export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH
fi
# }}}

# variables
export LANG=en_US.UTF-8
export TERM="xterm-256color"
export PAGER="less"
export DOTFILEDIR=${HOME}/.dotfile
export INSTALL_ROOT=${HOME}/softs/install
export SOLARIZED_THEME=light

# aliases
alias ssh='ssh -Y'

# make ~/.antigen inside dotfile# {{{
if ! readlink ${HOME}/.antigen | grep 'dotfile/bundle' -q; then
  echo "${HOME}/.antigen is not inside dotfile"
  echo "create a directory (if not exist) in ${DOTFILEDIR} to save zsh plugins"
  mkdir -p ${DOTFILEDIR}/bundle/antigen/.antigen

  echo "linking ${HOME}/.antigen to ${DOTFILEDIR}/bundle/antigen/.antigen"
  rm -rf ${HOME}/.antigen && ln -s ${DOTFILEDIR}/bundle/antigen/.antigen ${HOME}/.antigen || exit
fi
# }}}
# set true to improve performance, but need to run `antigen-reset` after any changes
export _ANTIGEN_CACHE_ENABLED=${_ANTIGEN_CACHE_ENABLED:-false}
source ${DOTFILEDIR}/bundle/antigen/antigen.zsh

antigen use oh-my-zsh # use oh-my-zsh as library
antigen bundles << EOBUNDLES
  mafredri/zsh-async
  zsh-users/zsh-completions
  git
  docker
  fasd
  pip
  joel-porquet/zsh-dircolors-solarized
  history-substring-search
  derekdreery/zsh-ag
  zsh-users/zsh-syntax-highlighting
  colored-man-pages
  ${DOTFILEDIR}/zsh/plugin
EOBUNDLES

#antigen theme evan # a skinny, topless prompt, use it if your computer is really slow
antigen theme blinks
antigen apply

# config after antigen
if [[ -z ${EDITOR+x} ]]; then
  echo "EDITOR is not set!"
else
  export GIT_EDITOR=${EDITOR}
  alias e=$EDITOR
fi
