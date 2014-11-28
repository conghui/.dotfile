# system depending aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls="ls --color=auto "
elif [[ "$OSTYPE" == "darwin"* ]]; then
  export CLICOLOR=1
  export LSCOLOR="ExGxBxDxCxEgEdxbxgxcxd"
  alias ls="ls -G "
  alias vim="mvim -v"
fi

alias e="vim"
alias sl='ls'
alias ll="ls -lrt"
alias l='ll'
alias la='l -aS'

alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'

alias sshx='ssh -X'

alias pbcopy='xclip -selection clipboard'

# in this manner, a nice command:  h <searchterm>
alias h='history | grep $1'

# open the file using gnome default program
alias go='gnome-open'

# alias only for zsh
alias zshconfig="vim ~/.zshrc"
alias valgrind="valgrind --leak-check=full"

alias nsight='nsight &'

# vim: ft=zsh
