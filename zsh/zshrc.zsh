ZSHDIR=${HOME}/.dotfile/zsh


# source alias and set environment variables
source ${ZSHDIR}/vars.sh
source_if_exist ${ZSHDIR}/localvars.sh

# Source Prezto.
source ~/.zprezto/init.zsh

hash direnv &> /dev/null && eval "$(direnv hook zsh)"

# change color of `ls`
COLOR_FILE=${DOTFILE_BUNDLE_ROOT}/dircolors-solarized/dircolors.ansi-dark
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors  -b $COLOR_FILE ) >/dev/null 2>&1
