#
ZSHDIR=${HOME}/.dotfile/zsh

# Source Prezto.
source ${ZSHDIR}/zprezto/init.zsh

# Source self-defined scripts
source ${ZSHDIR}/vars.sh
source ${ZSHDIR}/fasd.zsh

# change color of `ls`
COLOR_FILE=${DOTFILE_ROOT}/solarized/dircolors/dircolors.ansi-dark
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors  -b $COLOR_FILE )
