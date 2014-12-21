# system depending aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias go='gnome-open'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias go='open'
  alias top='top -s1 -o cpu -R -F'
fi

# keep some command originally
unalias rm &> /dev/null

alias ls="ls --color=auto "
alias l='ls'
alias sl='ls'
alias ll="ls -lrt"
alias cd..='cd ..'
alias sshx='ssh -X'

# in this manner, a nice command:  h <searchterm>
alias h='history | grep $1'

alias valgrind="valgrind --leak-check=full"
alias nsight='nsight &'

# vim: ft=zsh
