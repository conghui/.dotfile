#
ZSHDIR=${HOME}/.dotfile/zsh

source ${ZSHDIR}/vars.sh

# Source Prezto.
source ~/.zprezto/init.zsh

# Source self-defined scripts
source ${ZSHDIR}/fasd.zsh

# change color of `ls`
COLOR_FILE=${DOTFILE_BUNDLE_ROOT}/dircolors-solarized/dircolors.ansi-dark
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors  -b $COLOR_FILE )
