# vim: fdm=marker fdl=0 ft=zsh
# keep this file as simple & clean as possible
# setup PATH for linuxbrew/homebrew # {{{
if [[ "$OSTYPE" == "linux-gnu" ]]; then # only set for Linux
  export PATH="$HOME/.linuxbrew/bin":"$HOME/.linuxbrew/sbin":$PATH
  export MANPATH="$HOME/.linuxbrew/share/man":$MANPATH
  export INFOPATH="$HOME/.linuxbrew/share/info":$INFOPATH
elif [[ "$OSTYPE" == "darwin"* ]]; then # only set for MAC
  export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH
fi
# }}}

# variables
[[ -f ~/.linuxbrew/bin/vim ]] && VIM=~/.linuxbrew/bin/vim  || VIM=vim
export LANG=en_US.UTF-8
export EDITOR="$VIM -u $HOME/.dotfile/vim/vimrc"
export GIT_EDITOR=${EDITOR}
export TERM="xterm-256color"
export PAGER="less"
export DOTFILEDIR=${HOME}/.dotfile
export INSTALL_ROOT=${HOME}/softs/install

# aliases
alias e=$EDITOR
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
# source config before antigen# {{{
if ls $DOTFILEDIR/zsh/custom/ | grep -q '.zsh'; then
  for f in $DOTFILEDIR/zsh/custom/*.zsh; do
    source $f
  done
fi
# }}}
# set true to improve performance, but need to run `antigen-reset` after any changes
export _ANTIGEN_CACHE_ENABLED=${_ANTIGEN_CACHE_ENABLED:-false}
source ${DOTFILEDIR}/bundle/antigen/antigen.zsh

antigen use oh-my-zsh # use oh-my-zsh as library
antigen bundles << EOBUNDLES
  mafredri/zsh-async                        # required by other plugins
  zsh-users/zsh-completions
  git
  docker
  fasd
  joel-porquet/zsh-dircolors-solarized
  history-substring-search
  derekdreery/zsh-ag
  zsh-users/zsh-syntax-highlighting
  colored-man-pages
  sindresorhus/pure
  ${DOTFILEDIR}/zsh/plugin
EOBUNDLES

#antigen theme evan # a skinny, topless prompt, use it if your computer is really slow
antigen apply

# color different file types and file extensions
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
