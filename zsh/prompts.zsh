function build-prompt() {
  case "$?" in
      0) statcolor="%{$fg[green]%}" ;;
      *) statcolor="%{$fg[red]%}"   ;;
    esac

  echo "%{$fg[cyan]%}%2c $statcolor>%{$reset_color%} "
}

function build-right-prompt() {
  echo "%{$fg[cyan]%}%n %{$reset_color%}@ %{$fg_bold[green]%}%U%m%u %{$reset_color%}(%T)"
}

PS1='`build-prompt`'
RPS1='`build-right-prompt`'

[ $TERM = "eterm-color" ] && setopt singlelinezle
[ $TERM = "dumb" ] && unsetopt zle && PS1='$ ' && RPS1=''
