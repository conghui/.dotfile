autoload -Uz colors && colors
bindkey -e # emacs style key bindings
local WORDCHARS=${WORDCHARS//\//}
setopt CORRECT

# declare pbcopy in Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# use oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=(common-aliases \
         screen \
         git \
         colored-man \
         copydir copyfile \
         autojump \
         dirhistory \
         rsync \
         extract \
         history \
         safe-paste \
         osx \
         brew \
         textmate
         )

DISABLE_AUTO_UPDATE=true # for zsh
source ${ZSH}/oh-my-zsh.sh

ZSHDIR=${HOME}/.dotfile/zsh
source ${ZSHDIR}/aliases.zsh
source ${ZSHDIR}/vars.zsh
source ${ZSHDIR}/zsh-syntax-highlighting-filetypes.zsh
source ${ZSHDIR}/prompts.zsh

# change color of `ls`
command -v gdircolors >/dev/null 2>&1 && eval $( gdircolors -b ${ZSHDIR}/LS_COLORS)
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors  -b ${ZSHDIR}/LS_COLORS)

