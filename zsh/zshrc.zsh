autoload -Uz colors && colors
bindkey -e # emacs style key bindings
local WORDCHARS=${WORDCHARS//\//}
setopt CORRECT

# use oh-my-zsh
ZSH=$HOME/.oh-my-zsh
#plugins=(command-not-found common-aliases per-directory-history \
#         screen web-search yum wd git gitfast git-extras github)
plugins=(command-not-found common-aliases \
         screen web-search yum wd git gitfast git-extras github)
source $ZSH/oh-my-zsh.sh

# Load nested configs
for f in $(find -L ${HOME}/.dotfile/zsh -name \*.zsh | grep -v zshrc.zsh | grep -v install_zsh.zsh); do
  source $f
done

# change color of `ls`
command -v gdircolors >/dev/null 2>&1 && eval $( gdircolors -b $HOME/.zsh/LS_COLORS)
command -v  dircolors >/dev/null 2>&1 && eval $( dircolors -b $HOME/.zsh/LS_COLORS)
