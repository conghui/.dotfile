# vim: fdm=marker fdl=0 ft=zsh

fpath+=(~/.linuxbrew/Cellar/zsh/5.2/share/zsh/functions/)

# variables
export EDITOR="nvim"
export GIT_EDITOR=${EDITOR}
export TERM="xterm-256color"
export PAGER="less"
export DOTFILEDIR=${HOME}/.dotfile
export INSTALL_ROOT=${HOME}/softs/install

# aliases
alias e=$EDITOR
alias ssh='ssh -Y'
alias docker-stop-all='docker stop `docker ps -aq`'
alias docker-rm-all='docker rm `docker ps -aq`'

if [[ "$OSTYPE" == "linux-gnu" ]]; then # only set for Linux
  alias open='gnome-open'

  export PATH="$HOME/.linuxbrew/bin":"$HOME/.linuxbrew/sbin":$PATH
  export MANPATH="$HOME/.linuxbrew/share/man":$MANPATH
  export INFOPATH="$HOME/.linuxbrew/share/info":$INFOPATH
elif [[ "$OSTYPE" == "darwin"* ]]; then # only set for MAC
  export PATH="$(brew --prefix coreutils)/libexec/gnubin":$PATH
fi

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
export _ANTIGEN_CACHE_ENABLED=false
source ${DOTFILEDIR}/bundle/antigen/bin/antigen.zsh

# antigen settings
antigen use oh-my-zsh

# put plugins to be loaded here
antigen bundles << EOBUNDLES
  mafredri/zsh-async
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-completions
  zlsun/solarized-man
  joel-porquet/zsh-dircolors-solarized
  git
  fasd
  history-substring-search
  ${DOTFILEDIR}/zsh/plugin-config
  ${DOTFILEDIR}/zsh/custom
EOBUNDLES

# a skinny, topless prompt, use it if your computer is really slow
#antigen theme evan

antigen bundle sindresorhus/pure # my favorite theme

antigen apply
