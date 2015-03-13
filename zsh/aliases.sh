# system depending aliases
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias go='gnome-open'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  alias go='open'
  alias top='top -s1 -o cpu -R -F'
fi

# keep some command originally
unalias rm &> /dev/null

# zsh alias
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# ls
alias ls='ls --color=auto'

# rsync
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"

alias cd..='cd ..'
alias sshx='ssh -Y'
alias grep='grep --color=auto'

# for git
alias git='noglob git'
alias gst='git status'
alias gd='git diff'

# editing files
alias evar='vim ~/.vars.sh'
alias valgrind="valgrind --leak-check=full"
alias nsight='nsight &'

# vim: ft=zsh
