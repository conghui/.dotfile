alias e="vim" # 'e' is short for 'editor'

alias ls="ls --color=auto "
alias sl='ls'
alias ll="ls -l"
alias l='ls -lS'
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

# vim: ft=zsh
