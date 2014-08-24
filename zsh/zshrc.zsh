autoload -Uz colors && colors
bindkey -e # emacs style key bindings
local WORDCHARS=${WORDCHARS//\//}
setopt CORRECT

# use oh-my-zsh
ZSH=$HOME/.oh-my-zsh
plugins=(common-aliases \
         screen \
         git\
         colored-man \
         copydir copyfile \
         autojump \
         dirhistory \
         rsync \
         osx
         )

source $ZSH/oh-my-zsh.sh

# Load nested configs
for f in $(find -L ${HOME}/.dotfile/zsh -name \*.zsh | grep -v zshrc.zsh | grep -v install_zsh.zsh); do
  source $f
done

# change color of `ls`
command -v gdircolors >/dev/null 2>&1 && eval $( gdircolors -b $HOME/.zsh/LS_COLORS)
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors -b $HOME/.zsh/LS_COLORS)
