#
ZSHDIR=${HOME}/.dotfile/zsh

# Source Prezto.
source ~/.zprezto/init.zsh

# source alias and set environment variables
source ${ZSHDIR}/vars.sh

# Source self-defined scripts
source ${ZSHDIR}/fasd.zsh

# Source commands
source ${ZSHDIR}/command.zsh

# change color of `ls`
COLOR_FILE=${DOTFILE_BUNDLE_ROOT}/dircolors-solarized/dircolors.ansi-dark
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors  -b $COLOR_FILE )
