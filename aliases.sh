alias e="vim" # 'e' is short for 'editor'

alias ls="ls --color=auto "
alias sl='ls'
alias ll="ls -l"
alias l='ls -lS'
alias la='l -aS'

alias ..='cd ..'
alias ...='cd ../..'
alias cd..='cd ..'

alias ssh='ssh -X'

alias abook='abook --datafile ~/.cfg/mutt-config/abook/addressbook'

alias pbcopy='xclip -selection clipboard'

# in this manner, a nice command:  h <searchterm>
alias h='history | grep $1'

# open the file using gnome default program
alias go='gnome-open'

# vim: ft=zsh
# alias only for zsh
alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

alias find="noglob find"
alias su="su -s /bin/zsh"
alias zshconfig="vim ~/.zshrc"
alias valgrind="valgrind --leak-check=full"
