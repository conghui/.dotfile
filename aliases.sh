# system depending aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias go='gnome-open'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias go='open'
fi

alias ls="ls --color=auto "
alias l='ls'
alias sl='ls'
alias ll="ls -lrt"
alias cd..='cd ..'
alias sshx='ssh -X'
alias pbcopy='xclip -selection clipboard'

# in this manner, a nice command:  h <searchterm>
alias h='history | grep $1'

alias valgrind="valgrind --leak-check=full"
alias nsight='nsight &'

# vim: ft=zsh
