# vim: ft=zsh fdm=marker fdl=0
#
ZSHDIR=${HOME}/.dotfile/zsh
source ${ZSHDIR}/vars.sh
source_if_exist ${ZSHDIR}/localvars.sh

export ZPLUG_HOME=$DOTFILE_BUNDLE_ROOT/zplug
source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"

zplug "sorin-ionescu/prezto", use:init.zsh, hook-build:\
  "rm -f ~/.zprezto ~/.zlogin ~/.zlogout ~/.zpreztorc ~/.zprofile ~/.zshenv; \
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto ~/.zprezto; \
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto/runcoms/zlogin ~/.zlogin; \
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto/runcoms/zlogout ~/.zlogout; \
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto/runcoms/zprofile ~/.zprofile; \
  ln -s $ZPLUG_HOME/repos/sorin-ionescu/prezto/runcoms/zshenv ~/.zshenv; \
  ln -s $ZSHDIR/zpreztorc ~/.zpreztorc;"

zplug "junegunn/fzf", hook-build:"./install"
zplug "supercrabtree/k"
zplug "mafredri/zsh-async"
zplug "zlsun/solarized-man"
#zplug "unixorn/docker-helpers.zshplugin"
zplug "felixr/docker-zsh-completion"
zplug "joel-porquet/zsh-dircolors-solarized", hook-load:"setupsolarized dircolors.ansi-dark"
zplug "zsh-users/zsh-syntax-highlighting", nice:10

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

hash direnv &> /dev/null && eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
