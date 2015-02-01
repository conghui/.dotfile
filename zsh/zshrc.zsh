autoload -Uz colors && colors
bindkey -e # emacs style key bindings
local WORDCHARS=${WORDCHARS//\//}
setopt CORRECT

# declare pbcopy in Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

ZSHDIR=${HOME}/.dotfile/zsh

# Source Prezto.
source ${ZSHDIR}/zprezto/init.zsh
source ${ZSHDIR}/vars.sh
source ${ZSHDIR}/filetype.zsh
source ${ZSHDIR}/fasd.zsh
source ${ZSHDIR}/prompts.zsh

# change color of `ls`
COLOR_FILE=${DOTFILE_ROOT}/solarized/dircolors/dircolors.ansi-dark
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors  -b $COLOR_FILE )
